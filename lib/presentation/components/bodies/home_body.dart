import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/domain/blocs/home_bloc/home_bloc.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/presentation/components/failure_widget.dart';
import 'package:cryptocurrency_chart_app/presentation/components/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const HomeAppBar(userName: "Denis", userPhotoPath: "adsfas"),
        ];
      },
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeFailureState) {
            switch (state.failure) {
              case ApiException.network:
                return FailureWidget(
                  failure: state.failure,
                  icon: Icons.wifi_off,
                );
              default:
                return FailureWidget(
                  failure: state.failure,
                  icon: Icons.error,
                );
            }
          }

          if (state is HomeLoadingState) {
            return HomeContent.loading(context);
          }

          if (state is HomeLoadedState) {
            return HomeContent(cryptoModels: state.cryptoModels);
          }

          return HomeContent.loading(context);
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.cryptoModels,
  });

  static Widget loading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  final List<CryptoModel> cryptoModels;

  @override
  Widget build(BuildContext context) {
    if (cryptoModels.isEmpty) {
      return const Center(
        child: Text("No data"),
      );
    }

    return ListView.builder(
      itemBuilder: (context, i) {
        return Text(cryptoModels[i].usdPrice.toString());
      },
      itemCount: cryptoModels.length,
    );
  }
}
