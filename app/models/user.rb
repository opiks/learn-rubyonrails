# email:string
# name:string
# password_digest:string
#
# password:string virtual by has_secure_password
# password_confirmation:string virtual by has_secure_password
class User < ApplicationRecord
    has_secure_password
end
