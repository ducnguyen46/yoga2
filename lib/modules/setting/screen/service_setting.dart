import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/constants/app_path.dart';

// ignore: must_be_immutable
class ServiceSetting extends StatelessWidget {
  String _policy = "this SERVICE is provided by Suntech Ltd. at no cost and is intended for use as is." +
      "\n\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service" +
      "\n\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy." +
      "\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Contacts Backup unless otherwise defined in this Privacy Policy." +
      "\n\nInformation Collection and Use" +
      "\n\nFor a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy." +
      "\n\nThe app does use third party services that may collect information used to identify you." +
      "\n\nLink to privacy policy of third party service providers used by the app" +
      "\n\nInformation that you provide to us" +
      "\n\nAbout the face data collecting: We do not collect any face data or user photos. My app provides functionality for users to create a funny sticker from their faces. Users can stitch faces into our drawings to create a fun sticker. Users can then share or use them in iMessage. We do not save this data on the server or send it to any 3rd party." +
      "\nWhen you first use the face recognition function, You may voluntarily grant us permission to access your camera and album to obtain your facial photo in your mobile device. Only if you confirm the permission, will we gain access to your camera and album?" +
      "\n\nCloud Safe is designed to never collect or store any sensitive information. All data stored in Cloud Safe cannot be accessed by us or other third parties because it is always encrypted. Our Terms of Service and Privacy Policy are available below." +
      "\n\nYour Secure Data is your property. We claim no rights to it. Only you may add, modify, and delete Secure Data at your discretion." +
      "\nData Processing Agreement (GDPR)" +
      "\n\nLog Data \nWe want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics." +
      "\n\nCookies\nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device’s internal memory." +
      "\nThis Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service" +
      "Service Providers \nWe may employ third-party companies and individuals due to the following reasons:" +
      "\n\nTo facilitate our Service;\nTo provide the Service on our behalf;\nTo perform Service-related services; or\nTo assist us in analyzing how our Service is used.\nWe want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose." +
      "\n\nSecurity\nWe value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security" +
      "\n\nLinks to Other Sites\nThis Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services." +
      "\n\nChildren’s Privacy\nThese Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions." +
      "\n\nChanges to This Privacy Policy\nWe may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page." +
      "\n\nContact us\nIf you have questions regarding this privacy policy, you may email mekimtan@gmail.com\nPhone number: 0947265979" +
      "\n81 duong khue my dinh 2, ha noi";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColor.smokeWhite,
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.smokeWhite,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.grayBlue.withOpacity(0.4),
                                offset: Offset(5, 5),
                                blurRadius: 30,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: SvgPicture.asset(
                            AppPath.toAssetsIcons + "corner-up-left.svg",
                            color: AppColor.blueDark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "Policy",
                  style: TextStyle(
                    color: AppColor.grayBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontFamily: "GT",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Text(
                  _policy,
                  style: TextStyle(
                    color: AppColor.grayBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "GT",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
