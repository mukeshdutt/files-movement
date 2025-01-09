import os
import shutil
from datetime import datetime

def move_files_by_date(source_folder, destination_folder):
    if not os.path.exists(source_folder):
        print(f"The source folder {source_folder} does not exist.")
        return

    for filename in os.listdir(source_folder):
        file_path = os.path.join(source_folder, filename)
        if os.path.isfile(file_path):
            creation_time = os.path.getctime(file_path)
            creation_date = datetime.fromtimestamp(creation_time).strftime('%Y-%m-%d')
            destination_date_folder = os.path.join(destination_folder, creation_date)

            if not os.path.exists(destination_date_folder):
                os.makedirs(destination_date_folder)

            shutil.move(file_path, os.path.join(destination_date_folder, filename))
            print(f"Moved {filename} to {destination_date_folder}")

if __name__ == "__main__":
    source_folder = '/path/to/your/bulky/folder'
    destination_folder = '/path/to/your/destination/folder'
    move_files_by_date(source_folder, destination_folder)