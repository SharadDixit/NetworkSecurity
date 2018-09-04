(defprotocol blanchet basic

  (defrole init

    (vars (a b akey) (s skey) (d data))

    (trace

      (send (enc ( enc s (invk a)) b))

      (recv (enc d s))))

  (defrole resp

    (vars (a b akey) (s skey) (d data))

    (trace

      (recv (enc ( enc s (invk a)) b))

      (send (enc d s)))))

 

(defskeleton blanchet

  (vars (a b akey) (s skey) (d data))

  (defstrand init 2 (a a) (b b) (s s) (d d))

  (non-orig (invk a) (invk b))

  (uniq-orig s)

  (comment "Analyze from the initiator's perspective"))

 

(defskeleton blanchet

  (vars (a b akey) (s skey) (d data))

  (defstrand resp 2 (a a) (b b) (s s) (d d))

  (non-orig (invk a) (invk b))

  (uniq-orig d)

  (comment "Analyze from the responder's perspective"))

 

(defskeleton blanchet

  (vars (a b akey) (s skey) (d data))

  (defstrand resp 2 (a a) (b b) (s s) (d d))

  (deflistener d)

  (non-orig (invk a) (invk b))

  (uniq-orig d)

  (comment "Analyze from the responder's with a listener"))

 

(defskeleton blanchet

  (vars (a b akey) (s skey) (d data))

  (defstrand init 2 (a a) (b b) (s s) (d d))

  (defstrand resp 2 (a a) (s s) (d d))

  (non-orig (invk a))

  (uniq-orig s d)

  (comment "Analyze with disagree on values of b"))

 

;Corrected Protocol

 

(defprotocol blanchet-corrected basic

  (defrole init

    (vars (a b akey) (s skey) (d data))

    (trace

      (send (enc ( enc s b (invk a)) b))

      (recv (enc (enc d s) a))))

  (defrole resp

    (vars (a b akey) (s skey) (d data))

    (trace

      (recv (enc ( enc s b (invk a)) b))

      (send (enc (enc d s) a)))))

 

(defskeleton blanchet-corrected

  (vars (a b akey) (s skey) (d data))

  (defstrand init 2 (a a) (b b) (s s) (d d))

  (non-orig (invk a) (invk b))

  (uniq-orig s)

  (comment "Analyze from the initiator's perspective"))

 

(defskeleton blanchet-corrected

  (vars (a b akey) (s skey) (d data))

  (defstrand resp 2 (a a) (b b) (s s) (d d))

  (non-orig (invk a) (invk b))

  (uniq-orig d)

  (comment "Analyze from the responder's perspective"))

 

(defskeleton blanchet-corrected

  (vars (a b akey) (s skey) (d data))

  (defstrand resp 2 (a a) (b b) (s s) (d d))

  (deflistener d)

  (non-orig (invk a) (invk b))

  (uniq-orig d)

  (comment "Analyze from the responder's with a listener"))

 

(defskeleton blanchet-corrected

  (vars (a b akey) (s skey) (d data))

  (defstrand init 2 (a a) (b b) (s s) (d d))

  (defstrand resp 2 (a a) (s s) (d d))

  (non-orig (invk a))

  (uniq-orig s d)

  (comment "Analyze with disagree on values of b"))
