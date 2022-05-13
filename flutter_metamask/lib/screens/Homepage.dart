import 'package:flutter/material.dart';
import 'package:flutter_metamask/components/index.dart';
import 'package:flutter_metamask/providers/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MetaMaskHomePage extends StatefulWidget {
  const MetaMaskHomePage({Key? key}) : super(key: key);

  @override
  State<MetaMaskHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MetaMaskHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MetaMaskProvider()..initializeMetamaskProvider(),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Color(0xFF1c1143),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Color(0xFFffe125),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Kart Racing League',
                    style: GoogleFonts.teko(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'BLIND MINT EVENT',
                    style: GoogleFonts.kanit(
                      fontSize: 37.0,
                      color: Color(0xFFffe125),
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Spacer(),
                  Consumer<MetaMaskProvider>(
                    builder: (context, provider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 13.0,
                            backgroundColor: Color(0xFFffe125),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            provider.message,
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        onTap: () {},
                        text: 'APPROVE',
                        icon: Icons.file_copy_outlined,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Button(
                        onTap: () {
                          context
                              .read<MetaMaskProvider>()
                              .connectWithMetamask();
                        },
                        text: 'CONNECT WALLET',
                        icon: Icons.check,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
