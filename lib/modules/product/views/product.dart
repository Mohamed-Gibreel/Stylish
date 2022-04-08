import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/cart/cart.dart';
import 'package:stylish/modules/favourite/cubit/favourite_cubit.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/product/product.dart';
import 'package:stylish/util/constants.dart';

class ColorOptions {
  ColorOptions({
    required this.productColor,
    required this.color,
    required this.isSelected,
  });
  ProductColor productColor;
  String color;
  bool isSelected;

  set selected(bool value) {
    isSelected = value;
  }

  bool get selected {
    return isSelected;
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  List<ColorOptions> colorOptions = [];
  late ProductModel product;
  bool isLiked = false;
  late CartItemModel cartItem;
  bool isInCart = false;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    product = widget.product;
    _tabController = TabController(length: product.colors.length, vsync: this);
    isLiked = context.read<FavouriteCubit>().favourites.contains(product);
    mapColors();
    if (mounted && isLiked) setState(() {});
    super.didChangeDependencies();
  }

  void mapColors() {
    if (product.colors.isNotEmpty) {
      colorOptions = product.colors
          .map(
            (color) => ColorOptions(
              productColor: color,
              color: color.color,
              isSelected: false,
            ),
          )
          .toList();
      if (colorOptions.isNotEmpty) colorOptions.first.selected = true;
      cartItem = CartItemModel(
        product: product,
        quantity: 1,
        selectedColor: colorOptions.first.productColor,
      );
      isInCart = context
          .read<CartCubit>()
          .cart
          .where(
            (item) =>
                item.product.uid == cartItem.product.uid &&
                item.selectedColor == cartItem.selectedColor,
          )
          .isNotEmpty;
      if (mounted) setState(() {});
    }
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    final addFavourite = !isLiked;
    if (addFavourite) {
      context.read<FavouriteCubit>().addProductToFavorites(product);
    } else {
      context.read<FavouriteCubit>().removeProductFromFavorites(product);
    }
    return !isLiked;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _addToCart() {
    final l10n = context.l10n;
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            for (final selectedColor in colorOptions) {
              if (selectedColor.isSelected) {
                cartItem.selectedColor = selectedColor.productColor;
              }
            }
            context.read<CartCubit>().addProductToCart(cartItem);
            isInCart = context
                .read<CartCubit>()
                .cart
                .where(
                  (item) =>
                      item.product.uid == cartItem.product.uid &&
                      item.selectedColor == cartItem.selectedColor,
                )
                .isNotEmpty;
            if (mounted) setState(() {});
          },
          child: Center(
            child: Text(
              l10n.addToCart,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _alreadyInCart() {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.shopping_cart, color: Colors.white),
          SizedBox(
            width: 10.w,
          ),
          const Text(
            'Item added to cart',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    isLiked = context.read<FavouriteCubit>().favourites.contains(product);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        actionButtons: [
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: LikeButton(
                isLiked: isLiked,
                onTap: onLikeButtonTapped,
                size: 25.w,
                padding: EdgeInsets.zero,
                likeCountPadding: EdgeInsets.zero,
                likeBuilder: (bool isLiked) {
                  return isLiked
                      ? SvgPicture.asset('assets/products/heart.svg')
                      : const Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.grey,
                        );
                },
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(int.parse(product.bgColor, radix: 16))
                  .withOpacity(product.bgOpacity),
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: product.colors.isNotEmpty
                    ? DefaultTabController(
                        length: product.colors.length,
                        child: SizedBox(
                          height: 300.h,
                          child: TabBarView(
                            controller: _tabController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: product.colors
                                .map(
                                  (color) => Image.asset(
                                    color.productImage,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    : Image.asset(
                        product.image,
                        height: 300.h,
                      ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 325.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.r),
                    topRight: Radius.circular(45.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '\$${product.price}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          'Colors',
                          style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            // fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        if (colorOptions.isNotEmpty)
                          Row(
                            children: colorOptions
                                .map(
                                  (colorOption) => GestureDetector(
                                    onTap: () {
                                      for (final color in colorOptions) {
                                        color.selected = false;
                                      }
                                      final index =
                                          colorOptions.indexOf(colorOption);
                                      _tabController.animateTo(index);
                                      colorOption.selected = true;
                                      cartItem = cartItem.copyWith(
                                        selectedColor: colorOption.productColor,
                                      );
                                      isInCart = context
                                          .read<CartCubit>()
                                          .cart
                                          .where(
                                            (item) =>
                                                item.product.uid ==
                                                    cartItem.product.uid &&
                                                item.selectedColor ==
                                                    cartItem.selectedColor,
                                          )
                                          .isNotEmpty;
                                      if (mounted) setState(() {});
                                    },
                                    child: Container(
                                      width: 26.w,
                                      height: 26.h,
                                      margin: EdgeInsets.only(right: 9.w),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: colorOption.selected
                                            ? Border.all(
                                                width: 2.w,
                                                color: Constants.primaryColor,
                                              )
                                            : null,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // color: Color(0xFFBEE8EA),
                                          color: Color(
                                            int.parse(
                                              colorOption.color,
                                              radix: 16,
                                            ),
                                          ).withOpacity(1),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        else
                          Text(
                            'No colors available',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical:
                  MediaQuery.of(context).viewPadding.bottom > 0 ? 0 : 10.h,
            ),
            child: colorOptions.isEmpty
                ? Container(
                    width: double.infinity,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        'Out of stock :(',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                // : isInCart
                //     ? _alreadyInCart()
                //     : _addToCart(),
                : AnimatedCrossFade(
                    firstChild: _alreadyInCart(),
                    secondChild: _addToCart(),
                    crossFadeState: isInCart
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 400),
                  ),
          ),
        ),
      ),
    );
  }
}
