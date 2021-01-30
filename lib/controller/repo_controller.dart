import 'package:online_team_management/model/Task.dart';
import 'package:online_team_management/model/User.dart';
import 'package:online_team_management/service/auth_service.dart';
import 'package:online_team_management/service/task_service.dart';
import 'package:online_team_management/service/user_service.dart';

class RepoController {
  Future<List<Task>> getUserRepo() async {
    List<Task> tasks = await UserService().getTasksFromUserTeams();
    List<Task> doneTasks = [];
    for (Task task in tasks) {
      if (task.isDone) {
        doneTasks.add(task);
      }
    }
    print(doneTasks.length);
    return doneTasks;
  }
}
