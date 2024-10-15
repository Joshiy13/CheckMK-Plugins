# CheckMK Monitoring Plugins / Active Checks

This repository contains a collection of scripts designed to enhance the functionality of the CheckMK monitoring software.

## Scripts

### /plugins/paloalto
- **paloaltoAdvancedThreatProtection.sh**: This plugin requests the Experiration Date of the Advanced Threat Protection license of your paloalto firewall, and warns you if it starts running out.

### /plugins/panorama
- **panoramaNFRSupport**: This plugin requests the experation date of the NFR Support icense of your panorama, and warns you if it starts running out.

## Usage

To use these scripts, follow the instructions below:

1. Save the script in `/local/lib/nagios/plugins` and make it executable:
   ```sh
   chmod u+x /local/lib/nagios/plugins/your_script_name

2. In the Webinterface, click Setup.
3. Search for Integrate Nagios Plugins and click on it.
4. Click on Add rule.
5. Enter the name of the check under Service Description.
6. Enter the name of the script under Command Line.
7. Enter the machine to which the check should be assigned under Explicit Hosts.


Feel free to contribute by submitting pull requests or opening issues for any bugs or feature requests.

**Happy monitoring!**
