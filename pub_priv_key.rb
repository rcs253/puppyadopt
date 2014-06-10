require 'openssl'
require 'base64'

data = 'credit_card_number=4111111111111111'

puts "Encrypting data: (this is what would be entered into the browser)"
puts data
puts

# Everyone on the Internet gets access to this public key
public_key = OpenSSL::PKey::RSA.new(File.read("mykey.pub"))
encrypted_data = Base64.encode64(public_key.public_encrypt(data))

puts "Encrypted data: (this is what would be sent to the server)"
puts encrypted_data
puts

# This file is kept a secret on the server of example.com
private_key = OpenSSL::PKey::RSA.new(File.read("mykey.pem"))

decrypted_data = private_key.private_decrypt(Base64.decode64(encrypted_data))

puts "Decrypted data: (this is what the server gets after decryption)"
puts decrypted_data
puts