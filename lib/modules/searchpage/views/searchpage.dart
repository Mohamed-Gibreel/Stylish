import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/favourite/cubit/favourite_cubit.dart';
import 'package:stylish/modules/favourite/favourite.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/searchpage/searchpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    searchController.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favouriteCubit = context.read<FavouriteCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 16.h,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              'Abu Dhabi',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
        actionButtons: const [NotificationButton()],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Hero(
              tag: 'search-bar',
              child: SearchBar(
                editingController: searchController,
                filterCb: () {
                  showModalBottomSheet<FilterBottomSheet>(
                    isScrollControlled: true,
                    context: context,
                    barrierColor: Colors.black.withOpacity(.7),
                    backgroundColor: Colors.transparent,
                    builder: (ctx) => const FilterBottomSheet(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent searches',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14.w,
                ),
              ],
            ),
            const Divider(),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Search results showing for "${searchController.text}"',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
              // childAspectRatio: 0.8,
              clipBehavior: Clip.none,
              crossAxisSpacing: 18.w,
              mainAxisSpacing: 16.h,
              children: favouriteCubit.favourites
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(
                          '/productPage',
                          arguments: e,
                        )
                            .then((_) {
                          if (mounted) setState(() {});
                        });
                      },
                      child: FavouriteCard(
                        product: e,
                      ),
                    ),
                  )
                  .toList(),
            ))
          ],
        ),
      ),
    );
  }
}
