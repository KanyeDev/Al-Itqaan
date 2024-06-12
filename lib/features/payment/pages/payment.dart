
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 375,
                height: 812,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 16,
              top: 194,
              child: Text(
                'Select your preferred payment option',
                style: TextStyle(
                  color: Color(0xFF595959),
                  fontSize: 12.80,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 218,
              child: Container(
                width: 343,
                height: 194,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF0172EF)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 8,
                      top: 8,
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.all(4),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1.50, color: Color(0xFF0172EF)),
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF0172EF),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 12,
                      child: Text(
                        'Paystack',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.80,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      top: 51,
                      child: Container(
                        width: 327,
                        height: 80,
                        padding: const EdgeInsets.only(
                          top: 27,
                          left: 20,
                          right: 21.40,
                          bottom: 28,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFBABABA)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 285.60,
                              height: 25,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 1,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      padding: const EdgeInsets.only(right: 0.05),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 65,
                                    top: 0,
                                    child: Container(
                                      width: 33.37,
                                      height: 24.57,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 1.28,
                                            top: 0,
                                            child: Container(
                                              width: 30.81,
                                              height: 19.04,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 30.81,
                                                    height: 19.05,
                                                    child: Stack(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            top: 20.32,
                                            child: Container(
                                              width: 33.37,
                                              height: 4.25,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 139,
                                    top: 2,
                                    child: Container(
                                      width: 51,
                                      height: 16.53,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 231,
                                    top: 1,
                                    child: Container(
                                      width: 54.60,
                                      height: 18.87,
                                      child: Stack(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 106,
                      top: 40,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Secured by ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.24,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'paystack',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.24,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 0.12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      top: 139,
                      child: Container(
                        width: 327,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Color(0xFFE6F1FD)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Make payment using your debit and credit cards',
                              style: TextStyle(
                                color: Color(0xFF0172EF),
                                fontSize: 10.24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 420,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 176,
                  bottom: 33,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFBABABA)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.50, color: Color(0xFFBABABA)),
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Credit Card (Stripe)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.80,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 734,
              child: Container(
                width: 343,
                height: 44,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Color(0xFFDDB45A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Save changes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF172B59),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 44,
              child: Container(
                height: 54,
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 16,
                  right: 225,
                  bottom: 14,
                ),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 24, height: 24, child: Stack()),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Payment',
                      style: TextStyle(
                        color: Color(0xFF172B59),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0.06,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 375,
                height: 44,
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 24,
                  right: 18.67,
                  bottom: 11,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.only(top: 1),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 54,
                              height: 20,
                              child: Text(
                                '9:41',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                  letterSpacing: -0.50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 66.66,
                      height: 11.34,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 42.33,
                            top: 0,
                            child: Container(
                              width: 24.33,
                              height: 11.33,
                              child: Stack(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 778,
              child: Container(
                width: 375,
                height: 34,
                padding: const EdgeInsets.only(
                  top: 21,
                  left: 121,
                  right: 120,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 134,
                      height: 5,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 98,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x07101828),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                      spreadRadius: -2,
                    ),BoxShadow(
                      color: Color(0x14101828),
                      blurRadius: 16,
                      offset: Offset(0, 12),
                      spreadRadius: -4,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 28,
                        right: 27,
                        bottom: 12,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFDDB45A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Payment method',
                            style: TextStyle(
                              color: Color(0xFF172B59),
                              fontSize: 12.80,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFCF8EF),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.40, color: Color(0xFFBABABA)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Payment history',
                            style: TextStyle(
                              color: Color(0xFF172B59),
                              fontSize: 12.80,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
