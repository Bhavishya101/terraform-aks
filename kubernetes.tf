provider "kubernetes" {
  config_path = "~/.kube/config"
  #config_path = "/root/.kube/kubeconfig"
}

resource "kubernetes_namespace" "test" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_config_map" "test" {
  metadata {
    name = "stage-config"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  data = {
    "index.html" = "<h1>Hello AIA, This is Stage Environment!</h1>"
  }
}
resource "kubernetes_deployment" "test" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    replicas = 1 
    selector {
      match_labels = {
        app = "MyTestApp"
      }
    }
    template {
      metadata {
        labels = {
          app = "MyTestApp"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "nginx-container"
          port {
            container_port = 80
          }
          volume_mount {
            name       = "index"
            mount_path = "/usr/share/nginx/html"
          }
        }
        volume { 
          name      =  "index"
          config_map {
              name  =  kubernetes_config_map.test.metadata.0.name
         }
        }
      }
    }
  }
}
resource "kubernetes_service" "test" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.test.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }
  }
}


