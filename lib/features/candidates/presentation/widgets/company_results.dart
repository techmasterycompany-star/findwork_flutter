import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/companies_details.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/company_card.dart';
import 'package:flutter/material.dart';

class CompanyResults extends StatelessWidget {
  const CompanyResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Company Results (42)",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.tune, size: 24, color: AppColors.primary500),
              ),
            ],
          ),
          CompanyCard(
            companyName: 'Tech Company',
            rating: 4.5,
            overview:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et dolore magna aliqua.',

            badge1: 'Global',
            badge1Color: Colors.blue,

            badge2: 'Hiring',
            badge2Color: Colors.green,

            jobs: '50 Jobs open',
            employees: '1,234 employees',
            salaries: '88.1K Salaries',

            logoUrl: 'asset/images/image-cmpony.png',

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompaniesDetails(),
                ),
              );
            },
          ),
          AppSpacing.vertical12,
          CompanyCard(
            companyName: 'Tech Company',
            rating: 4.5,
            overview:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et dolore magna aliqua.',

            badge1: 'Global',
            badge1Color: Colors.blue,

            badge2: 'Hiring',
            badge2Color: Colors.green,

            jobs: '50 Jobs open',
            employees: '1,234 employees',
            salaries: '88.1K Salaries',

            logoUrl: 'asset/images/image-cmpony.png',

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompaniesDetails(),
                ),
              );
            },
          ),
          AppSpacing.vertical12,
          CompanyCard(
            companyName: 'Tech Company',
            rating: 4.5,
            overview:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et dolore magna aliqua.',

            badge1: 'Global',
            badge1Color: Colors.blue,

            badge2: 'Hiring',
            badge2Color: Colors.green,

            jobs: '50 Jobs open',
            employees: '1,234 employees',
            salaries: '88.1K Salaries',

            logoUrl: 'asset/images/image-cmpony.png',

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompaniesDetails(),
                ),
              );
            },
          ),
          AppSpacing.vertical12,
          AppSpacing.vertical8,
        ],
      ),
    );
  }
}
