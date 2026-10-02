import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_home.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_text_form_fild.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController messageController;
  late final TextEditingController subjectController;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
    subjectController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCard(
                        borderRadius: 6,
                        height: 24,
                        width: 130,
                        backgroundColor: AppColors.primary100,
                        child: Row(
                          children: [
                            ActiveJobsBadge(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CandidateHome(),
                                  ),
                                );
                              },
                              text: S.of(context).Home,
                              textStyle: TextStyle(
                                color: AppColors.primary500,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 12,
                              color: AppColors.primary500,
                            ),
                            ActiveJobsBadge(
                              onPressed: () {
                                // ToDo
                              },
                              text: 'Contact us',
                              textStyle: TextStyle(
                                color: AppColors.primary500,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.vertical8,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Contact ',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            TextSpan(
                              text: 'Job4U',
                              style: TextStyle(
                                color: AppColors.primary500,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.horizontal24,
                  AppSpacing.horizontal12,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Image.asset(
                          "asset/images/image2.png",
                          width: 135,
                          height: 86,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "We’re here to help! Whether you have a  \nquestion about our platform, need support, or \n want to share feedback feel free to reach out",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              AppSpacing.vertical20,
              Form(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Contact Us',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        'Fill out the form below and our team will get back to you to as soon as possible ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary100,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.mark_email_unread_outlined,
                          color: AppColors.primary500,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'name',
                      labelText: 'Full Name',
                    ),
                    AppSpacing.vertical12,
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'email',
                      labelText: 'Email',
                    ),
                    AppSpacing.vertical12,
                    CustomTextFormField(
                      controller: subjectController,
                      hintText: 'subject',
                      labelText: 'Subject',
                    ),
                    AppSpacing.vertical12,
                    CustomTextFormField(
                      controller: messageController,
                      maxLines: 4,
                      maxLength: 512,
                      hintText: 'Type your message here....',
                      labelText: 'Message',
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 300),
                      child: Text(
                        '256/521',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    AppSpacing.vertical12,
                    Container(
                      height: 40,
                      margin: EdgeInsetsDirectional.only(start: 190),
                      padding: EdgeInsetsDirectional.only(start: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Send Message',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AppSpacing.horizontal8,
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.message_outlined,
                                size: 16,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSpacing.vertical64,
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Info',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  dense: true,
                                  isThreeLine: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    'Phone',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    '+20 98482346',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  leading: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.call_end_outlined,
                                      color: AppColors.primary500,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                              AppSpacing.horizontal24,
                              Expanded(
                                child: ListTile(
                                  dense: true,
                                  isThreeLine: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    'Phone',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    '+20 98482346',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  leading: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: AppColors.primary500,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppSpacing.vertical20,
                    AppFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
