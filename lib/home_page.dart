import 'dart:convert';

import 'package:crative_minds_devolpment/github_repo_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class home_page extends StatelessWidget {
  const home_page({
    super.key,
  });

  Future<List<GithubRepo>> _fetchRepos(int page) async {
    final client = http.Client();
    var url = Uri.https('api.github.com', '/users/square/repos', {
      "page": page.toString(),
    });
    await  Future.delayed(Duration.zero);
    try   {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonMap = jsonDecode(response.body);
        final githubRepos = jsonMap
            .map((githubRepo) => GithubRepo.fromJson(githubRepo))
            .toList();
        for (int i = 0; i < githubRepos.length; i++) {
          final box = await Hive.openBox<GithubRepo>('github_repos');
          box.put(githubRepos[i].id, githubRepos[i]);
        }

        return githubRepos;
      } else {
        return <GithubRepo>[];
      }
    } catch (e) {
      return <GithubRepo>[];
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(

      builder: (context, snapshot) => (snapshot.hasData && snapshot.data != [])
          ? ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final repo = snapshot.data![index];
                return ListTile(
                  title: Text(repo.name),
                  subtitle: Text(repo.description),
                );
              },
            )
          : snapshot.hasError
              ? Center(
                  child: Text('Error: ${snapshot.error}'),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
      future:  _fetchRepos(1),
    ));
  }
}
