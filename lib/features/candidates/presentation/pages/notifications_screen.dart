import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'Notification',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.neutral500,
                  fontSize: 12,
                ),
              ),
              AppSpacing.vertical12,

              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 18,
                        decoration: BoxDecoration(
                          color: AppColors.primary600,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      AppSpacing.horizontal8,
                      Text(
                        'Your Notification',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Mark all as read',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.neutral600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.vertical20,

              // Filter Tab Bar (All Container)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.neutral200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'All',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary600,
                                ),
                          ),
                          AppSpacing.horizontal8,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '4',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: AppColors.primary600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical20,

              // Notifications List with Timeline
              _buildNotificationItem(
                context: context,
                statusColor: AppColors.success500,
                statusBgColor: AppColors.success50,
                statusText: 'Accepted',
                titleSuffix: 'Applications Accepted',
                titleSuffixColor: AppColors.success600,
                time: '3h',
                badgeText1: 'Software House',
                badgeText2: 'Full Time',
                cardBgColor: AppColors.white,
                content: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.neutral700,
                      height: 1.4,
                      fontSize: 12,
                    ),
                    children: const [
                      TextSpan(
                        text:
                            'Congratulations! Your application has been accepted. Your online interview is scheduled for ',
                      ),
                      TextSpan(
                        text: 'Jun 25 at 2:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary600,
                        ),
                      ),
                      TextSpan(
                        text:
                            '. The Google Meet link will be sent to you via WhatsApp within a few hours.',
                      ),
                    ],
                  ),
                ),
              ),

              _buildNotificationItem(
                context: context,
                statusColor: AppColors.error500,
                statusBgColor: AppColors.error50,
                statusText: 'Rejected',
                titleSuffix: 'Application Rejected',
                titleSuffixColor: AppColors.error500,
                time: '1 weak',
                badgeText1: 'Software House',
                badgeText2: 'Full Time',
                cardBgColor: AppColors.error100.withValues(alpha: 0.4),
                content: Text(
                  'Thank you for your interest in the Senior UI/UX Designer role. Unfortunately, we have decided to move forward with other candidates at this time.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.neutral700,
                    height: 1.4,
                    fontSize: 12,
                  ),
                ),
              ),

              _buildNotificationItem(
                context: context,
                statusColor: AppColors.error500,
                statusBgColor: AppColors.error50,
                statusText: 'Rejected',
                titleSuffix: 'Application Rejected',
                titleSuffixColor: AppColors.error500,
                time: '1 weak',
                badgeText1: 'Software House',
                badgeText2: 'Full Time',
                cardBgColor: AppColors.neutral100.withValues(alpha: 0.5),
                isLast: true,
                content: Text(
                  'Thank you for your interest in the Senior UI/UX Designer role. Unfortunately, we have decided to move forward with other candidates at this time.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.neutral700,
                    height: 1.4,
                    fontSize: 12,
                  ),
                ),
              ),
              AppSpacing.vertical12,
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build Timeline Notification Card
  Widget _buildNotificationItem({
    required BuildContext context,
    required Color statusColor,
    required Color statusBgColor,
    required String statusText,
    required String titleSuffix,
    required Color titleSuffixColor,
    required String time,
    required String badgeText1,
    required String badgeText2,
    required Widget content,
    required Color cardBgColor,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline Indicator (Left Bar)
          SizedBox(
            width: 20,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // Line
                if (!isLast)
                  Positioned(
                    top: 10,
                    bottom: 0,
                    child: Container(width: 1, color: AppColors.neutral200),
                  ),
                // Dot
                Positioned(
                  top: 24,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.horizontal8,

          // Card Area
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cardBgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.neutral200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo Icon
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary900,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset('asset/images/image-cmpony.png'),
                      ),
                      AppSpacing.horizontal12,

                      // Title & Subtitle
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Tech Mastry: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.neutral900,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: titleSuffix,
                                          style: TextStyle(
                                            color: titleSuffixColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  time,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: AppColors.neutral400,
                                        fontSize: 11,
                                      ),
                                ),
                              ],
                            ),
                            AppSpacing.vertical8,

                            // Badges Row
                            Row(
                              children: [
                                _buildBadge(
                                  badgeText1,
                                  AppColors.primary50,
                                  AppColors.primary600,
                                ),
                                AppSpacing.horizontal8,
                                _buildBadge(
                                  badgeText2,
                                  AppColors.warning50,
                                  AppColors.warning600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vertical12,

                  // Inner Content Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status Badge Tag (Accepted / Rejected)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusBgColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            statusText,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        AppSpacing.vertical8,

                        // Body Text / RichText
                        content,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Small Helper for Category Badges
  Widget _buildBadge(String text, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
