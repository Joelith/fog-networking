require "spec_helper"
require "fog/aws"
require "fog/oraclecloud"
require 'pp'

describe Fog::Networking do
  it "has a version number" do
    expect(Fog::Networking::VERSION).not_to be nil
  end

  it "can connect AWS EC2 to Oracle DB" do
  	#Fog.mock!
  	begin
  		db = Fog::OracleCloud[:database].instances.get('DB4Hytera')
  	rescue Fog::OracleCloud::Database::NotFound		
  		puts "Not Found - Creating Oracle Instance"
  		db = Fog::OracleCloud[:database].instances.create(
				:service_name => 'DB4Hytera',
				:description => 'A new database',
				:edition => 'SE',
				:ssh_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAkNNQ4ri2oUW46mBO/4CHMGCOALciumwGvFEMDLGNnlDbUSqU4IRrqgj+znLClfb29Oer0devdarM6DilsZVgZ2YbI5ZD5vICR/O9J0c28dArwbtFeIjcV2TCWyj5xKEXF1r+OrJMexHQa0fW1URGrU8QODpJNC/9eCVGcEXddL31xTZYpjoVOCVx66kNa6lSHEVV3T4zaCby9Oe5QI4gZe1+xyxHPNEW5wogwS3dlKSyL2CfBP0aUKOmJ5Nrl8+y0GqJQXdGjZ9FIknmwWueRW/6qPQvZocjOZ8YiPZgAP0RNy6lL+u8mnAazj/mrEdmB5QUzpDAllIr5Tn/xaddZQ==',
				:shape => 'oc3',
				:version => '12.1.0.2',
				:backup_destination => 'NONE',
				:admin_password => 'Welcome1#',
				:usable_storage => '15'
			)
		end
  	aws_instance = Fog::Compute[:aws].servers.get('i-07822667b62de3341')
		if !aws_instance then
			puts "Not Found - Creating AWS Instance"
			aws_instance = Fog::Compute[:aws].servers.create
			aws_instance.wait_for {
				print "." 
				ready? 
			}
			puts "\n"
		end
  	Fog::Networking::Services.connect_instances(aws_instance, db, 1521)
  end
 
#  it "can connect AWS and Oracle" do
#  	Fog.mock!
#  	begin
#			#oracle_instance = Fog::Compute[:oraclecloud].instances.get('OracleCodeDemo/c92a3c5d-f064-4e58-874a-77a578b61fab')
#			oracle_instance = Fog::Compute[:oraclecloud].instances.get('/Compute-gse00011381/bala.gupta/TempOracleCode/9700b5cb-2e71-42b4-9087-8f9ac2ceef5d')
#		rescue Fog::Compute::OracleCloud::NotFound		
#			puts "Not Found - Creating Oracle Instance"
#			sshkey = Fog::Compute[:oraclecloud].ssh_keys.create(
#				:name 		=> 'OracleCodeKey',
#				:enabled 	=> true,
#				:key			=> 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCEabzXdQjmAI+oj/v1a5xJbDVvjhAy4BRL5nyQeDCKAyy9gwmjK4dyUq0foTENgx6IjERdqHyR4WqAm/#RZvEQY+LGhZOJoTzBajjDTZmaKt21nDQvm7/JPsylU1DGp9lpCHubnrEjzZQL9U/6AkVh4PB/J2Lg0zyRYY93BAgVnOjL7mE+s6mewRjt3NiMYozZaPSM2x/Qo4jeN/#nXwCsmqc49As4gjAuoDgVcRwBGNz3O37AjyXa01qt1NFYgKc3XSMmXMC+wJiXITlu2lZFN+6XjbU5nrV/2r485W0e8w2tomtZdWW4C84G2YCuJIgAczbWY12NjmMB+TMAJS3'
#			)
#			oracle_instance = Fog::Compute[:oraclecloud].instances.create(
#				:name=>'OracleCodeDemo', 
#				:shape=>'oc3', 
#				:imagelist=>'/oracle/public/oel_6.4_2GB_v1',
#				:label=>'oracle_code',
#				:sshkeys=>[sshkey.name]
#			)
#
#			oracle_instance.wait_for { 
#				print "." 
#				ready? 
#			}
#			puts "\n"
#		end
#		aws_instance = Fog::Compute[:aws].servers.get('i-07822667b62de3341')
#		if !aws_instance then
#			puts "Not Found - Creating AWS Instance"
#			aws_instance = Fog::Compute[:aws].servers.create
#			aws_instance.wait_for {
#				print "." 
#				ready? 
#			}
#			puts "\n"
#		end
#  	Fog::Networking::Services.connect_instances(aws_instance, oracle_instance, 1521)
#  end
end
