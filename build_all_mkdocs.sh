#!/bin/bash
##################################################################################
#### DON't CHANGE THE BELOW MANDATORY SECTION WHICH IS A PRE-REQ FOR THE LABS ####
##################################################################################

# Set the Root directory, which is where this file is located.
root_dir=`pwd`

# Clear the existing /site content:
#rm -r site
#echo "BUILD_INFO - The existing /site has been removed to avoid any leftovers."
#sleep 1

# Build the top level:
cd $root_dir/MkDocs/toplevel
mkdocs build
echo "BUILD_INFO - The top level of IBM Maximo Labs are build."

##################################################################################
#### DON't CHANGE THE ABOVE MANDATORY SECTION WHICH IS A PRE-REQ FOR THE LABS ####
##################################################################################

#### BELOW IS WHERE EACH LAB IS BEING BUILD                                   ####

# Build the Monitor 8.8+ CSV Importer level:
lab=monitor_nodered_csv_importer_2.0
cd $root_dir/MkDocs/$lab
mkdocs build
echo "BUILD_INFO - The $lab labs are build and added under the top level of IBM Maximo Labs."
mv $root_dir/docs/$lab/img/$lab $root_dir/docs/img/
echo "BUILD_INFO - The $lab lab images has been moved under /docs/img/$lab."

# Build the Monitor Edge Data Collector level:
lab=edc_8.11
cd $root_dir/MkDocs/$lab
mkdocs build
echo "BUILD_INFO - The $lab labs are build and added under the top level of IBM Maximo Labs."
mv $root_dir/docs/$lab/img/$lab $root_dir/docs/img/
echo "BUILD_INFO - The $lab lab images has been moved under /docs/img/$lab."



########################################################################################
#### DON't CHANGE THE BELOW MANDATORY SECTION WHICH IS PART OF THE TOPLEVEL CONTENT ####
########################################################################################

# Build the template level:
lab=template_1.0
cd $root_dir/MkDocs/$lab
mkdocs build
echo "BUILD_INFO - The $lab labs are build and added under the top level of IBM Maximo Labs."
mv $root_dir/docs/$lab/img/$lab $root_dir/docs/img/
echo "BUILD_INFO - The $lab lab images has been moved under /docs/img/$lab."

# Build the contribution level:
lab=contribute
cd $root_dir/MkDocs/$lab
mkdocs build
echo "BUILD_INFO - The $lab labs are build and added under the top level of IBM Maximo Labs."
mv $root_dir/docs/$lab/img/$lab $root_dir/docs/img/
echo "BUILD_INFO - The $lab lab images has been moved under /docs/img/$lab."


# Start the web server hosting the complete site - then open the following URL in a browser: http://127.0.0.1:8080
cd $root_dir/docs
echo "BUILD_INFO - Starting the web server on http://127.0.0.1:8080."
python -m http.server --cgi 8080
