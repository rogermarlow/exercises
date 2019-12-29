require 'openssl'

def compare_files
  file_to_text = Hash.new
  1.upto(99) { |n|
    pem_l = OpenSSL::PKey::RSA.new File.read "#{n}.pem"
    (n+1).upto(100) { |m|
      pem_r = OpenSSL::PKey::RSA.new File.read "#{m}.pem"
      gcd = pem_l.n.gcd(pem_r.n)
      if gcd != 1 then
        other_factor_l = (pem_l.n / gcd)[0]
        file_to_text.store("#{n}.bin", decrypt_bin_file("#{n}.bin", make_rsa_key(gcd,other_factor_l)))

        other_factor_r = (pem_r.n / gcd)[0]
        file_to_text.store("#{m}.bin", decrypt_bin_file("#{m}.bin", make_rsa_key(gcd,other_factor_r)))
      end
    }
  }
  return file_to_text
end

def make_rsa_key(p, q)
  key = OpenSSL::PKey::RSA.new
  
  n = p*q
  p1 = p-1
  q1 = q-1
  phi = p1*q1
  e = OpenSSL::BN.new("65537")
  d = e.mod_inverse(phi)
  dmp1 = d % p1
  dmq1 = d % q1
  iqmp = q1.mod_inverse(p)

  key.set_key(n, e, d)
  key.set_factors(p, q)
  key.set_crt_params(dmp1, dmq1, iqmp)

  return key
end

def decrypt_bin_file(file_name, key)
  file = File.open(file_name,"rb")
  encrypted = file.read
  file.close
  return key.private_decrypt(encrypted)
end

compare_files.each do |file_name, plain_text|
  puts "#{file_name}: #{plain_text}"
end
