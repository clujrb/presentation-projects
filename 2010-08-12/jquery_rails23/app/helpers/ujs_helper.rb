 
 # app/helpers/ujs_helper.rb
 module UjsHelper
   def link_to(label, url, options={})
     confirm, method, remote = [:confirm, :method, :remote].map { |key|
       options.delete(key)
     }
     
     super(label, url, options.merge({
       :"data-confirm" => confirm,
       :"data-method"  => method,
       :"data-remote"  => remote,
       :rel            => (confirm || method || remote) ? "nofollow" : nil
     }))
   end
 end
 
 