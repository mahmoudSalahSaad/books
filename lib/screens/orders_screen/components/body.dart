import 'package:flutter/material.dart';
import 'package:menu_egypt/components/app_bar.dart';
import 'package:menu_egypt/utilities/constants.dart';
import 'package:menu_egypt/utilities/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(2),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppBarWidget(title: 'طلباتى'),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                              'assets/images/menuegypt_sandwitches.png'),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    "الدهان",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1 منتج - تم التوصيل",
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                      Text(
                        "01-10-2022",
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: kAppBarColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text('تفاصيل الطلب'),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: kAppBarColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text('اعادة الطلب'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Text(
                    '50.0 جم',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.white,
              ),
              itemCount: 10,
            )
          ],
        ),
      ),
    );
  }
}
