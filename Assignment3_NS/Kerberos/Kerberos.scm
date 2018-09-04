(defprotocol kerberos basic

(defrole client

  (vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

  (trace (send (cat crtc c t (enc tc n2 (privk c)) n1))

         (recv (cat c tgt (enc crtas (enc k n2 (privk as)) (pubk c)) (enc t ak tas n1 k)))))

(defrole kas_as

  (vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

  (trace (recv (cat crtc c t (enc tc n2 (privk c)) n1))

         (send (cat c tgt (enc crtas (enc k n2 (privk as)) (pubk c)) (enc t ak tas n1 k))))))

 

(defskeleton kerberos

(vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

(defstrand client 2 (c c) (as as) (t t) (k k) (ak ak) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(non-orig (privk c) (privk as))

(uniq-orig n1 n2))

 

(defskeleton kerberos

(vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

(defstrand kas_as 2 (c c) (as as) (t t) (k k) (ak ak) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(non-orig (privk c) (privk as))

(uniq-orig k ak))

 

(defskeleton kerberos

(vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

(defstrand client 2 (c c) (as as) (t t) (k k) (ak ak) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(deflistener k)

(non-orig (privk c) (privk as))

(uniq-orig n1 n2))

 

(defskeleton kerberos

(vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

(defstrand client 2 (c c) (as as) (t t) (k k) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(defstrand kas_as 2 (as as) (t t) (k k) (ak ak) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(non-orig (privk as))

(uniq-orig k ak n1 n2))

 

;;Corrected-Protocol

 

(defprotocol kerberos_corrected basic

(defrole client

  (vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

  (trace (send (cat c (enc crtc t as tc n2 n1 (privk c))))

         (recv (enc (enc tgt crtas k c crtc n1 n2 (enc t ak tas n1 k) (privk as)) (pubk c)))))

(defrole kas_as

  (vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

  (trace (recv (cat c (enc crtc t as tc n2 n1 (privk c))))

         (send (enc (enc tgt crtas k c crtc n1 n2 (enc t ak tas n1 k) (privk as)) (pubk c))))

         (uniq-orig k)))

 

(defskeleton kerberos_corrected

(vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

(defstrand client 2 (c c) (as as) (t t) (k k) (ak ak) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(non-orig (privk c) (privk as))

(uniq-orig n1 n2))

 

(defskeleton kerberos_corrected

(vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

(defstrand kas_as 2 (c c) (as as) (t t) (k k) (ak ak) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(non-orig (privk c) (privk as))

(uniq-orig k ak))

 

(defskeleton kerberos_corrected

(vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

(defstrand client 2 (c c) (as as) (t t) (k k) (ak ak) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(deflistener k)

(non-orig (privk c) (privk as))

(uniq-orig n1 n2))

 

(defskeleton kerberos_corrected

(vars (c as t name) (k ak skey) (n1 n2 crtc crtas tgt data) (tc tas text))

(defstrand client 2 (c c) (as as) (t t) (k k) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(defstrand kas_as 2 (as as) (t t) (k k) (ak ak) (n1 n1) (n2 n2) (crtc crtc) (crtas crtas) (tgt tgt) (tc tc) (tas tas))

(non-orig (privk as))

(uniq-orig k ak n1 n2))
