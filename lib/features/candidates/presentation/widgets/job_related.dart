import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/job_details.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';

class JobRelated extends StatelessWidget {
  const JobRelated({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          JobCard(
            title: 'UI/UX Designer',
            company: 'Tech Company',
            imagePath: "asset/images/image1.png",
            location: 'Canada',
            salary: "\$40000 - \$42000",
            postedTime: '1 hour ago',
            typeJob: 'Full-Time',
            jobplace: 'Hybrid',
            jobDescription:
                'Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed '
                'do eiusmod tempor et...',
            onDetails: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JobDetails()),
              );
            },
            onBookmark: () {},
          ),
          AppSpacing.vertical8,
          JobCard(
            title: 'UI/UX Designer',
            company: 'Tech Company',
            imagePath: "asset/images/image1.png",
            location: 'Canada',
            salary: "\$40000 - \$42000",
            postedTime: '1 hour ago',
            typeJob: 'Full-Time',
            jobplace: 'Hybrid',
            jobDescription:
                'Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed '
                'do eiusmod tempor et...',
            onDetails: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JobDetails()),
              );
            },
            onBookmark: () {},
          ),
          AppSpacing.vertical8,
          JobCard(
            title: 'UI/UX Designer',
            company: 'Tech Company',
            imagePath: "asset/images/image1.png",
            location: 'Canada',
            salary: "\$40000 - \$42000",
            postedTime: '1 hour ago',
            typeJob: 'Full-Time',
            jobplace: 'Hybrid',
            jobDescription:
                'Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed '
                'do eiusmod tempor et...',
            onDetails: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JobDetails()),
              );
            },
            onBookmark: () {},
          ),
          AppSpacing.vertical8,
        ],
      ),
    );
  }
}
