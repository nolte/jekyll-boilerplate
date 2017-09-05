#!/bin/bash
gem install bundler
# configure plantum dependencies
 wget http://repo1.maven.org/maven2/net/sourceforge/plantuml/plantuml/$PLANTUML_VERSION/plantuml-$PLANTUML_VERSION.jar -O /tmp/plantuml.jar
echo "#!/bin/bash" > /tmp/plantuml
echo "java -jar /tmp/plantuml.jar \"\$1\" \"\$2\"" >> /tmp/plantuml
sudo mv /tmp/plantuml  /usr/bin/plantuml
sudo chmod u+x /usr/bin/plantuml
sudo apt-get -qq update
sudo apt-get install -y ditaa graphviz phantomjs
