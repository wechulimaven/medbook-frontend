import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/dimens.dart';
import '../../generated/l10n.dart';
import '../../layout_configs/portal_master_layout/portal_master_layout.dart';

import '../../shared/widgets/card_elements.dart';
import '../../theme/theme_extensions/app_button_theme.dart';
import '../../theme/theme_extensions/app_color_scheme.dart';
import '../../theme/theme_extensions/app_data_table_theme.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "dashboardScreen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dataTableHorizontalScrollController = ScrollController();

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final appColorScheme = Theme.of(context).extension<AppColorScheme>()!;
    final appDataTableTheme = Theme.of(context).extension<AppDataTableTheme>()!;
    final size = MediaQuery.of(context).size;

    final summaryCardCrossAxisCount = (size.width >= kScreenWidthLg ? 4 : 2);

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            lang.dashboard,
            style: themeData.textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth -
                        (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
                    summaryCardCrossAxisCount);

                return Wrap(
                  direction: Axis.horizontal,
                  spacing: kDefaultPadding,
                  runSpacing: kDefaultPadding,
                  children: [
                    SummaryCard(
                      title: "No. Users",
                      // title: lang.newOrders(2),
                      value: '150',
                      icon: Icons.shopping_cart_rounded,
                      backgroundColor: appColorScheme.info,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: "No. Courses",
                      // title: lang.newOrders(2),
                      value: '4',
                      icon: Icons.shopping_cart_rounded,
                      backgroundColor: appColorScheme.info,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.todaySales,
                      value: '+12%',
                      icon: Icons.ssid_chart_rounded,
                      backgroundColor: appColorScheme.success,
                      textColor: themeData.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: "Total revenue",
                      value: '44',
                      icon: Icons.group_add_rounded,
                      backgroundColor: appColorScheme.warning,
                      textColor: appColorScheme.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardHeader(
                    title: "Recent Unapproved Orders",
                    showDivider: false,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final double dataTableWidth =
                            max(kScreenWidthMd, constraints.maxWidth);

                        return Scrollbar(
                          controller: _dataTableHorizontalScrollController,
                          thumbVisibility: true,
                          trackVisibility: true,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _dataTableHorizontalScrollController,
                            child: SizedBox(
                              width: dataTableWidth,
                              child: Theme(
                                data: themeData.copyWith(
                                  cardTheme: appDataTableTheme.cardTheme,
                                  dataTableTheme:
                                      appDataTableTheme.dataTableThemeData,
                                ),
                                child:
                                    // BlocProvider(
                                    //   create: (context) => inject.get<OrderCubit>()
                                    //     ..getAllUnapprovedOrders(),
                                    //   child: BlocConsumer<OrderCubit, OrderState>(
                                    //     listener: (context, state) {
                                    //       if (state is SuccessOrderState) {
                                    //         // setState(() {});
                                    //       }
                                    //     },
                                    //     builder: (context, state) {
                                    //       if (state is SuccessOrderState) {
                                    //         return
                                    DataTable(
                                  showCheckboxColumn: false,
                                  showBottomBorder: true,
                                  columns: const [
                                    DataColumn(
                                        label: Text(
                                          'No.',
                                          textAlign: TextAlign.left,
                                        ),
                                        numeric: true),
                                    DataColumn(label: Text('Ordered on')),
                                    DataColumn(label: Text('ORDER DETAIL')),
                                    DataColumn(
                                        label: Text('Amount Paid'),
                                        numeric: true),
                                    DataColumn(
                                        label: Text('Price'), numeric: true),
                                    DataColumn(label: Text('Actions')),
                                  ],
                                  rows:
                                      // state.orderList!.map((e) {
                                      [].map((e) {
                                    var total = 0.0;
                                    for (var item in e.unitItems!) {
                                      total += item.price ?? 0;
                                    }
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            '${e.user?.firstName} ${e.user?.lastName}',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        DataCell(Text("${e.created_at}")),
                                        DataCell(
                                            Text('${e.amountPaid ?? 0.0}')),
                                        DataCell(Text('$total')),
                                        DataCell(Builder(
                                          builder: (context) {
                                            return const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // Padding(
                                                //   padding: const EdgeInsets
                                                //           .only(
                                                //       right:
                                                //           kDefaultPadding),
                                                //   child: OutlinedButton(
                                                //     onPressed: () =>
                                                //         showApproveDialog(
                                                //             "${e.orderId}",
                                                //             context),
                                                //     style: Theme.of(
                                                //             context)
                                                //         .extension<
                                                //             AppButtonTheme>()!
                                                //         .infoOutlined,
                                                //     child: const Text(
                                                //         "Approve"),
                                                //   ),
                                                // ),
                                                // OutlinedButton(
                                                //   onPressed: () =>
                                                //       showRejectDialog(
                                                //           "${e.orderId}",
                                                //           context),
                                                //   style: Theme.of(
                                                //           context)
                                                //       .extension<
                                                //           AppButtonTheme>()!
                                                //       .errorOutlined,
                                                //   child: const Text(
                                                //       "Reject"),
                                                // ),
                                              ],
                                            );
                                          },
                                        )),
                                      ],
                                    );
                                  }).toList(),
                                  //     );
                                  //   }
                                  //   return Center(
                                  //     child: customCircularProgressIndicator(
                                  //         context),
                                  //   );
                                  // },
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: SizedBox(
                        height: 40.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(
                            //     context, UnapprovedOrdersScreen.routeName);
                          },
                          style: themeData
                              .extension<AppButtonTheme>()!
                              .infoElevated,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: kDefaultPadding * 0.5),
                                child: Icon(
                                  Icons.visibility_rounded,
                                  size: (themeData
                                          .textTheme.labelLarge!.fontSize! +
                                      4.0),
                                ),
                              ),
                              const Text('View All'),
                            ],
                          ),
                        ),
                      ),
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
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 120.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        child: Stack(
          children: [
            Positioned(
              top: kDefaultPadding * 0.5,
              right: kDefaultPadding * 0.5,
              child: Icon(
                icon,
                size: 80.0,
                color: iconColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      value,
                      style: textTheme.headlineMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.labelLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
