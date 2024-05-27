import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_app/screens/home/view/pizza_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              "assets/pizza.png",
              scale: 2,
            ),
            SizedBox(
              width: 5,
            ),
            const Text(
              'PIZZA',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: Icon(CupertinoIcons.arrow_right_to_line))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            BlocBuilder<GetPizzaBloc, GetPizzaState>(builder: (context, state) {
          if (state is GetPizzaSuccess) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 9 / 16,
              ),
              itemCount: state.pizzas.length,
              itemBuilder: (context, int i) {
                return Material(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => PizzaDetails(
                              state.pizzas[i]

                            )),
                      );
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Image.network(state.pizzas[i].picture),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: state.pizzas[i].isVeg
                                            ? Colors.red
                                            : Colors.redAccent,

                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text(
                                      state.pizzas[i].isVeg
                                        ? "vage"
                                          : "non Vage",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    state.pizzas[i].spicy==1
                                    ? "BALANCE"
                                        : state.pizzas[i].spicy==2
                                      ? "Balance"
                                      : "Spicy"
                                    ,
                                    style: TextStyle(
                                      color: state.pizzas[i].spicy == 1
                                          ? Colors.green
                                          : state.pizzas[i].spicy == 2
                                          ? Colors.orange
                                          : Colors.grey, // Use neutral color for default or unexpected values
                                      fontWeight: FontWeight.w800,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              state.pizzas[i].name,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              state.pizzas[i].description,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '\$ ${state.pizzas[i].price-(state.pizzas[i].price * (state.pizzas[1].discount)/ 100)}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '\$ ${state.pizzas[i].price}.oo',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade500,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          CupertinoIcons.add_circled_solid))
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is GetPizzaLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Center(child: Text('An error has accured')),
            );
          }
        }),
      ),
    );
  }
}
