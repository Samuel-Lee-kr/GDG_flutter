import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Songdo GDG"),
            accountEmail: Text("katcrow@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: "https://cdn.mindgil.com/news/photo/202106/71557_8714_153.jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                // Image.network(
                //   "https://lh3.googleusercontent.com/kWVXB6YzStkdk76e2K3Pw-liNx5Q9xWfPDlTaNp2coU1F89yD6doUECZdMCbC-roj5kKnn4PWbCM7DJwxtXAFWYyftfDdWY_y3_nw-E8wwjLi5FRUDA2Y-AwRN-EWLOGgUH2lyC-v0pNxF6y8lO4LCYLZMMHzVd4ZUGXuFqbAC5RN1fVpxKc-oUGmg_YvRv3JkUupBWuUN1Vc2BMDk9lbqAK8L9-Yg3V5IkfiwWoSnv-zF12UyOKab_4wMe6R4cEWcSlVL_2gmj5R_O3qrqMnFttsPqO9XVmSPShXfuxiIKGcUoi3kdLhU2WvCEUBvvS0a0ZByl2OZZ3MKSIFpbTLjI0NLYU0v8zNBvk79TkOYJOVreLo--0RJyHgpD1fGEaucjn3d3VGKg5M2VQvXHgmpxiq96Z59L62dfVdfhYpHl5pUCTS1ERuX7qXNuR_EHrqvDAUG-Rki0GWhtNCsl5RxlGkA9uCMchoy_4AWEGmNciNxmmie_n5eBnl4e_PJ8NkFNYDpHS0TAPyw1249pipsZiZtCLLbG8LNp-LZNFv7ROubgOx7PVKDLqXiOoEAFeHDHn8ee_6RYOHfdxVlujyZC2ZnpdcvqMLDexb4IWwYBtlRxsLTUCX3Uvl3XGEomyIcZ2VEUoW6ejn1rZOovJDECHAtpUzHm91ZT6wqr7IFt8OgiK6eNpmfIVk7fUfXyLOzHnFpYfdsNg1U8jmtJOwG1DYrgKK8eTWuuc-MAM1nQakZm0HCsjvQDVHJQyjfGh_YPyFW_-d_4RLJz4w79R-3jvKeR3AP-HqrZiH1cBW0PLS27ZgyBm3aV9QoQIrzDdsJ993IODoT8ylM4WMDQRhsDnBTmUYkk4OlNuoz1BawwA25ml0MbizPAl1LPHbL9u1TM2bcY60ELfW2USagL-hHtqFWrmza81e5nnvA=w1327-h747-no?authuser=0",
                //   fit: BoxFit.cover,
                //   width: 90,
                //   height: 90,
                // ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://cdn.mindgil.com/news/photo/202106/71557_8714_153.jpg'
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          customListTile(icon: Icon(Icons.favorite), title: "Favorites"),
          customListTile(icon: Icon(Icons.people), title: "Friends"),
          customListTile(icon: Icon(Icons.share), title: "Share"),
          customListTile(icon: Icon(Icons.notifications), title: "Request", readCount: 8),
          Divider(thickness: 0.5),
          customListTile(icon: Icon(Icons.settings), title: "Settings"),
          customListTile(icon: Icon(Icons.description), title: "Policies", readCount: 12),
          Divider(thickness: 1),
          customListTile(icon: Icon(Icons.exit_to_app), title: "Exit"),
        ],
      ),
    );
  }

  ListTile customListTile({
    required Icon icon,
    required String title,
    int? readCount,
  }) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        print("${title}");
      },
      trailing: readCount == null
          ? SizedBox()
          : Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "${readCount}",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
    );
  }
}
