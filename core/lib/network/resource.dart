class Resource<T> {
  T? data;
  String? message;
  Object? extra;
  ResourceType type;

  Resource._({this.data, this.extra, this.message, required this.type});

  factory Resource.Success({T? data, String? message}) =>
      Resource._(data: data, message: message, type: ResourceType.SUCCESS);

  factory Resource.Error({Object? extra, String? message}) =>
      Resource._(extra: extra, message: message, type: ResourceType.ERROR);

  factory Resource.Unauthorized({T? data, String? message}) =>
      Resource._(data: data, message: message, type: ResourceType.UNAUTHORIZED);

  factory Resource.Empty({T? data, String? message}) =>
      Resource._(data: data, message: message, type: ResourceType.EMPTY);

  factory Resource.NetworkError({T? data, String? message}) => Resource._(
      data: data, message: message, type: ResourceType.NETWORK_ERROR);

  factory Resource.PagingEnd({T? data, String? message}) =>
      Resource._(data: data, message: message, type: ResourceType.PAGING_END);
}

enum ResourceType {
  SUCCESS,
  ERROR,
  UNAUTHORIZED,
  EMPTY,
  NETWORK_ERROR,
  PAGING_END
}
