# used to generate urls for stress testing the imageproxy with siege 
fs = require "fs"

base_url = "http://imageproxy-3.elasticbeanstalk.com/"

size_range = (x for x in [400..4000] by 50)

images = ["23530063934_e40063bf77_k.jpg",
"24075680371_3a7f668443_k.jpg",
"23530075244_8137068f67_o.jpg",
"24081890552_26713316a3_o.jpg",
"23530090674_13db3a510e_k.jpg",
"24083851712_9c1d4420da_o.jpg",
"23543362783_21b0bd6b03_o.jpg",
"24132046626_d55c21cdeb_o.jpg",
"23563132753_03a2295386_o.jpg",
"24132099226_3d0ccb6f86_k.jpg",
"23790440509_8e27c96a87_k.jpg",
"24132518226_bc803f85a0_k.jpg",
"23862660050_dcd21e4614_k.jpg",
"24132594056_44b6544cdb_o.jpg",
"23896815760_fae2c2fd06_o.jpg",
"24158240425_59c142d5b8_k.jpg",
"24050617852_b3b90689a5_k.jpg",
"24165947446_aeebe45491_o.jpg",
"24075621061_6efc17891a_k.jpg"]

result = ""
for x in size_range
  for img in images 
    result+=base_url+x+"x"+"/zach_test/"+img+"\n"

fs.writeFileSync "test_urls.txt", result

# http://imageproxy-3.elasticbeanstalk.com/2900x/wilhelm_von_kobell_-_cattle_market_before_a_large_city_on_a_lake,_1820-336d8cb1a4c10aefe5664e848cb10ee6.jpg
