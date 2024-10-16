import os
import pathlib


def create_paths(path_list):
    for path_str in path_list:
        path = pathlib.Path(path_str)  # Use pathlib for better path handling

        try:
            if path.suffix:  # Check if it should be a file
                # Create parent directories if they don't exist.
                path.parent.mkdir(parents=True, exist_ok=True)
                path.touch()  # Create an empty file
                print(f"File created: {path}")

            else:  # Check if it should be a folder
                path.mkdir(parents=True, exist_ok=True)
                print(f"Folder created: {path}")

        except OSError as e:
            print(f"Error creating '{path_str}': {e}")


# Example usage:#
# paths_to_create = [
# "/tmp/myproject/data",  # Folder
# "/tmp/myproject/data/file1.csv",  # File
# "/tmp/myproject/scripts/process.py",  #File
# "/home/user/documents/report.pdf"
folders_and_files = [
    "lib/models/user_model.dart",
    "lib/models/service_model.dart",
    "lib/models/booking_model.dart",
    "lib/models/customer_model.dart",
    "lib/models/report_model.dart",
    "lib/models/notification_model.dart",
    "lib/views/login/login_view.dart",
    "lib/views/login/signup_view.dart",
    "lib/views/dashboard/dashboard_view.dart",
    "lib/views/service_management/service_management_view.dart",
    "lib/views/booking_management/booking_management_view.dart",
    "lib/views/customer_management/customer_management_view.dart",
    "lib/views/reports_analytics/reports_analytics_view.dart",
    "lib/views/notifications/notifications_view.dart",
    "lib/viewmodels/login/login_viewmodel.dart",
    "lib/viewmodels/login/signup_viewmodel.dart",
    "lib/viewmodels/dashboard/dashboard_viewmodel.dart",
    "lib/viewmodels/service_management/service_management_viewmodel.dart",
    "lib/viewmodels/booking_management/booking_management_viewmodel.dart",
    "lib/viewmodels/customer_management/customer_management_viewmodel.dart",
    "lib/viewmodels/reports_analytics/reports_analytics_viewmodel.dart",
    "lib/viewmodels/notifications/notifications_viewmodel.dart",
    "lib/services/auth_service.dart",
    "lib/services/service_service.dart",
    "lib/services/booking_service.dart",
    "lib/services/customer_service.dart",
    "lib/services/report_service.dart",
    "lib/services/notification_service.dart",
    "lib/utils/constants.dart",
    "lib/utils/helpers.dart",
]

create_paths(folders_and_files)
