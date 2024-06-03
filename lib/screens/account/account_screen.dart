// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../domain/account/account_model.dart';
import '../../domain/account/account_repo.dart';
import '../../widgets/common/DataLoading.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<AccountModel> accounts = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadAccounts();
  }

  Future<void> loadAccounts() async {
    try {
      setState(() {
        loading = true;
      });
      final res = await AccountRepo().loadAccounts();
      setState(() {
        accounts = res;
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: loading
          ? Dataloading()
          : ListView.builder(
              shrinkWrap: true,
              itemCount: accounts.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(4),
                  titleTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                  subtitleTextStyle: TextStyle(fontFamily: "Poppins"),
                  leading: SizedBox(
                    height: 90,
                    width: 90,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(accounts[index].img),
                      radius: 100,
                    ),
                  ),
                  title: Text(accounts[index].title),
                  subtitle: Text(accounts[index].openingBalance.toString()),
                );
              }),
    );
  }
}
