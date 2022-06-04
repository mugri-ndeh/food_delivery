import 'package:delivery_app/home/models/food_item.dart';
import 'package:delivery_app/home/screens/favourites/favourites_provider.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    this.icon,
    required this.hint,
    this.prefixIcon,
    this.password,
    this.controller,
    this.validator,
  }) : super(key: key);
  final Icon? icon;
  final String hint;
  final Icon? prefixIcon;
  final bool? password;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              color: Colors.grey.shade200,
              blurRadius: 18),
        ],
      ),
      child: SizedBox(
        height: 45,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                textCapitalization: widget.password ?? false
                    ? TextCapitalization.none
                    : TextCapitalization.words,
                validator: widget.validator,
                controller: widget.controller,
                obscureText: widget.password == true ? !visible : false,
                decoration: InputDecoration(
                  prefixIcon: widget.icon,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
            widget.prefixIcon == null
                ? const SizedBox.shrink()
                : GestureDetector(
                    child: visible
                        ? widget.prefixIcon!
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                  )
          ],
        ),
      ),
    );
  }
}

class PhoneInput extends StatefulWidget {
  const PhoneInput({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              color: Colors.grey.shade200,
              blurRadius: 18),
        ],
      ),
      child: Center(
        child: IntlPhoneField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          dropdownIconPosition: IconPosition.leading,
          initialCountryCode: 'CM',
          pickerDialogStyle: PickerDialogStyle(),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.white)),
              hintText: 'Phone Number',
              border: const OutlineInputBorder()),
          onChanged: (phone) {
            print(phone.completeNumber);
            setState(() {
              number = phone.completeNumber;
            });
          },
          onCountryChanged: (country) {
            print('Country changed to: ' + country.name);
          },
        ),
      ),
    );
  }
}

// class CustomDate extends StatefulWidget {
//   CustomDate({
//     Key? key,
//     required this.hint,
//     required this.prefixIcon,
//     this.controller,
//   }) : super(key: key);
//   final String hint;
//   final Icon prefixIcon;
//   final TextEditingController? controller;

//   @override
//   State<CustomDate> createState() => CustomDateState();
// }
//
// class CustomDateState extends State<CustomDate> {
//   String pickedDate = '';
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         DatePicker.showDatePicker(context,
//             theme: const DatePickerTheme(
//               containerHeight: 210.0,
//             ),
//             showTitleActions: true,
//             minTime: DateTime(1950, 1, 1),
//             maxTime: DateTime.now(), onConfirm: (date) async {
//           // ignore: avoid_print
//           print('confirm $date');
//           setState(() {
//             widget.controller!.text = '${date.day}/${date.month}/${date.year}';
//           });
//         },
//             currentTime: DateTime.now().subtract(const Duration(days: 20)),
//             locale: LocaleType.en);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Palette.white,
//           boxShadow: [
//             BoxShadow(
//                 offset: const Offset(0, 1),
//                 color: Colors.grey.shade200,
//                 blurRadius: 18),
//           ],
//         ),
//         alignment: Alignment.center,
//         height: 50.0,
//         child: TextFormField(
//           controller: widget.controller,
//           enabled: false,
//           decoration: InputDecoration(
//             prefixIcon: widget.prefixIcon,
//             hintText: widget.hint,
//             hintStyle: const TextStyle(color: Colors.grey),
//             enabledBorder: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             errorBorder: InputBorder.none,
//             disabledBorder: InputBorder.none,
//             focusedErrorBorder: InputBorder.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

class PaymentMethodPopup extends StatefulWidget {
  const PaymentMethodPopup({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPopup> createState() => _PaymentMethodPopupState();
}

class _PaymentMethodPopupState extends State<PaymentMethodPopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: elevatedDecoration,
    );
  }
}

var elevatedDecoration = BoxDecoration(
  color: Palette.white,
  boxShadow: [
    BoxShadow(
        offset: const Offset(0, 1),
        color: Colors.grey.shade200,
        blurRadius: 18),
  ],
);

class CustomContainer extends StatefulWidget {
  const CustomContainer(
      {Key? key, this.height, this.width, this.child, this.padding})
      : super(key: key);
  final double? height;
  final Widget? child;
  final double? width;
  final double? padding;

  @override
  State<CustomContainer> createState() => _CustomContainer();
}

class _CustomContainer extends State<CustomContainer> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding == null
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 4),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                color: Colors.grey.shade200,
                blurRadius: 18),
          ],
        ),
        child: widget.child);
  }
}

class FoodCard extends StatefulWidget {
  const FoodCard({Key? key, this.onTap, required this.foodItem})
      : super(key: key);
  final Function()? onTap;
  final FoodItem foodItem;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      child: CustomContainer(
          height: 150,
          width: 180,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    height: 100,
                    width: 180,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Image.asset(
                            'assets/images/' + widget.foodItem.image,
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 0,
                    child: SizedBox(
                      height: 50,
                      width: 170,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomContainer(
                            padding: 2,
                            height: 30,
                            width: 50,
                            child: Center(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text('4.5'),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow,
                                )
                              ],
                            )),
                          ),
                          Consumer<FavouritesHelper>(builder: (_, fav, __) {
                            return GestureDetector(
                              onTap: () {
                                !fav.isfavourite(widget.foodItem)
                                    ? fav.addFavourites(widget.foodItem)
                                    : fav.remove(widget.foodItem);

                                // setState(() {});
                              },
                              child: CustomContainer(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  fav.isfavourite(widget.foodItem)
                                      ? Icons.favorite_outlined
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: 200,
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.foodItem.name),
                    Text(
                      widget.foodItem.price,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({Key? key, this.onTap, required this.foodItem})
      : super(key: key);
  final Function()? onTap;
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          height: 270,
          width: size.width,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    height: 200,
                    width: size.width,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Image.asset('assets/images/' + foodItem.image,
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 0,
                    child: SizedBox(
                      height: 50,
                      width: size.width - 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomContainer(
                            padding: 2,
                            height: 30,
                            width: 50,
                            child: Center(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text('4.5'),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow,
                                )
                              ],
                            )),
                          ),
                          const CustomContainer(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width,
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodItem.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Text(
                      foodItem.price,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
