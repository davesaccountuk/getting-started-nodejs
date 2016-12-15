echo "Logging in to bluemix CF";
cf login -u $CF_USER -p $CF_PASS -o $CF_ORG -s $CF_SPACE -a $CF_API

echo "Init Bluemix";
cf ic init

echo "List bluemix images";
cf ic images

echo "Start a bluemix container" 
CONTAINERID=$(cf ic run -p 5000:5000 registry.eu-gb.bluemix.net/aie_london/anamehere node /pipeline/source/app.js)

IP=$(cf ic ip request -q)

cf ic ip bind $IP $CONTAINERID

echo $IP
