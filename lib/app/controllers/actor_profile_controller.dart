import 'package:cinex/app/models/actor/actor_details.dart';
import 'package:cinex/app/models/cast.dart';
import 'package:cinex/app/services/tmdb_service.dart';
import 'package:get/get.dart';

class ActorProfileController extends GetxController {
  ActorProfileController({
    required this.cast,
  });

  final Cast cast;
  ActorDetails? actorDetails;

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchActorInfo();
  }

  fetchActorInfo() async {
    try {
      isLoading.value = true;

      actorDetails = await TMDbService().getActorDetails(cast.id);
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
