class MysqlController < ApplicationController

def mysql_test
client = Mysql2::Client.new(:host=>"gshoulder.ckgcutusm5ks.ap-northeast-1.rds.amazonaws.com" , :username=> "gshoulder", :password=>"gortlatmdqn" , :database=> "grumble")

@image = "http://d3341r5jo5uket.cloudfront.net/recipient/"
@rest_image = "icon.png"
@final_image =""


@timeline = client.query("select * from v_exhibition_grumbling")

@table = client.query("select * from v_exhibition_company")

end


end
