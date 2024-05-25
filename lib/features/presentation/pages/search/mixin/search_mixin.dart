
part of '../search_page.dart';

mixin SearchMixin on State<SearchPage>{
  TextEditingController searchController = TextEditingController();

  double _progress = 0.0;

  void _startProgress() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if(_progress < 1.0){
        setState(() {
          _progress += 0.1;
        });
        _startProgress();
      }
    });
  }

  @override
  void initState() {
    _startProgress();
    super.initState();
  }
}