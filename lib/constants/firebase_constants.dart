// ignore_for_file: constant_identifier_names

import "package:flutter/foundation.dart";

const String FCMSERVERKEY =
    "AAAAm1cLLhU:APA91bEd4peNy7KhfZ9YeEcxPiwtL1R1P8JocC8i9as69b8p9itAjvtiNlOfpIZZtfNgctEshHDPb1Bx9ExbWj05vt_KmdTg9aSUHdjElPvKny_0nlWYCchcJLWbOWxpmDuzhWYqp2KR";

class FirestoreConstants {
  static const pathUserCollection = "users";
  static const pathCourseCollection = "course";
  static const pathLevelsSubCollection = "levels";
  static const pathSectionsCollection =
      kDebugMode ? "sections_test" : "sections";
  static const pathUnitCollection = kDebugMode ? "units_test" : "units";
  static const pathTopicCollection = kDebugMode ? "topics_test" : "topics";
  static const pathOrdersCollection = kDebugMode ? "orders_test" : "orders";
  static const pathNotificationsCollection =
      kDebugMode ? "notifications_test" : "notifications";
}

class OrderStatus {
  static const CREATED = "CREATED";
  static const APPROVED = "APPROVED";
  static const REJECTED = "REJECTED";
  static const PENDING = "PENDING";
  static const REDEEMED = "REDEEMED";
}

Map<String, dynamic> idConstants = {
  "CS": {
    "id": "3BiLeQAHZIAoHF9M3pHV",
    "levels": {
      "FOUNDATION": "RBJVmgSGi5xW8nbau1DK",
      "INTERMEDIATE": "kUgjLdmudXssVOrZypwf",
      "ADVANCED": "qLchNafl8hZpgR1XIdh6",
    }
  },
  "ATD": {
    "id": "AxKciSnI6yk0Xvp3NhM2",
    "levels": {
      "ATD LEVEL I": "XL4wxSAhi1zkcdhvhjQ6",
      "ATD LEVEL II": "nP73tWoDPNaZa5iBjHmI",
      "ATD LEVEL III": "qHVErBLmyoGiFFr1K3l3",
    }
  },
  "CIFA": {
    "id": "cQmHzPtHaCM9vTEdeMI2",
    "levels": {
      "FOUNDATION": "VwJDHFDXmvDb8xxkaXgk",
      "INTERMEDIATE": "DXiArUw5E3RWYgc1hugO",
      "ADVANCED": "27oWSjQC0mLQkkCmEYId",
    }
  },
  "CPA": {
    "id": "f0Jn4RrWEtk3oP6UeBUp",
    "levels": {
      "FOUNDATION": "XBEJVVMWCoTDdOsqOYHf",
      "INTERMEDIATE": "N2MkDqSlvZa7xFo71hJ8",
      "ADVANCED": "tVHvNSJsjo8zFcnwZMHb",
    }
  },
};

class FirebaseCollectionIDS {
  static const CS = "3BiLeQAHZIAoHF9M3pHV";
  static const ATD = "AxKciSnI6yk0Xvp3NhM2";
  static const CIFA = "cQmHzPtHaCM9vTEdeMI2";
  static const CPA = "f0Jn4RrWEtk3oP6UeBUp";
}

class CSLevelIDS {
  static const FOUNDATION = "RBJVmgSGi5xW8nbau1DK";
  static const INTERMEDIATE = "kUgjLdmudXssVOrZypwf";
  static const ADVANCED = "qLchNafl8hZpgR1XIdh6";
}

class ATDLevelIDS {
  static const LEVEL1 = "XL4wxSAhi1zkcdhvhjQ6";
  static const LEVEL2 = "nP73tWoDPNaZa5iBjHmI";
  static const LEVEL3 = "qHVErBLmyoGiFFr1K3l3";
}

class CIFALevelIDS {
  static const FOUNDATION = "27oWSjQC0mLQkkCmEYId ";
  static const INTERMEDIATE = "DXiArUw5E3RWYgc1hugO ";
  static const ADVANCED = "qLchNafl8hZpgR1XIdh6";
}

class CPALevelIDS {
  static const FOUNDATION = "XBEJVVMWCoTDdOsqOYHf";
  static const INTERMEDIATE = "N2MkDqSlvZa7xFo71hJ8";
  static const ADVANCED = "tVHvNSJsjo8zFcnwZMHb";
}
