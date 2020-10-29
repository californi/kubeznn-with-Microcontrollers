module kubow.strategies;
import model "KubeZnnSystem:Acme" { KubeZnnSystem as M, KubernetesFam as K };
import lib "tactics.s";

define boolean highTraffic = M.kubeZnnS.traffic >= 50;
define boolean lowTraffic = M.kubeZnnS.traffic < 50;

/*
 * ----
 */
strategy selectingMicrocontroller [ lowTraffic || highTraffic ] {
  t0: (lowTraffic) -> differentMicrocontroller() @[15000 /*ms*/] {
    t0a: (success) -> done;
  }
  t1: (default) -> TNULL;
}