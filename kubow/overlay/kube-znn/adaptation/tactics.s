module kubow.strategies;
import model "KubeZnnSystem:Acme" { KubeZnnSystem as M, KubernetesFam as K };

define boolean highTraffic = M.kubeZnnS.traffic >= 50;
define boolean lowTraffic = M.kubeZnnS.traffic < 50;

tactic differentMicrocontroller() {
  condition {
    lowTraffic || highTraffic;
  }
  action {
    if (lowTraffic){
      M.scaleDown(M.scalabilityD, 1);
      M.scaleUp(M.fidelityD, 1);
    }    
    if (highTraffic){
      M.scaleUp(M.scalabilityD, 1);
      M.scaleDown(M.fidelityD, 1);
    }
  }
  effect @[10000]{
    lowTraffic;
  }
}
