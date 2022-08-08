import sys
import os
import subprocess


def make_new_feature(feature_name, has_demo=False):
    make_dir(f"{feature_name}Feature")
    make_project_file(feature_name, f"{feature_name}Feature", has_demo)
    make_sources(feature_name)
    make_tests(feature_name)

def write_code_in_file(file_path, codes):
    if not os.path.isfile(file_path):
        subprocess.run(['touch', file_path])

    master_key_file = open(file_path, 'w')
    master_key_file.write(codes)
    master_key_file.close()

def make_dir(path):
    if not os.path.exists(path):
        os.makedirs(path)

def make_dirs(paths):
    for path in paths:
        make_dir(path)

def make_project_file(feature_name, file_path, has_demo=False, dependencies=[]):
    project_path = file_path + '/Project.swift'
    file_name = file_path.split('/')[-1]
    file_content = f"""
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "{feature_name}Feature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature"""
    file_content += ",\n        ".join(dependencies)
    file_content += "\n    ]" 
    file_content += ",\n    hasDemo: true" if has_demo else ""
    file_content += "\n)"
    write_code_in_file(project_path, file_content)

def make_sources(feature_name):
    make_dir(f'{feature_name}Feature/Sources')
    feature_file_path = f'{feature_name}Feature/Sources/{feature_name}Feature.swift'
    feature_content = '// This is for tuist'
    write_code_in_file(feature_file_path, feature_content)

def make_tests(feature_name):
    make_dir(f'{feature_name}Feature/Tests')
    test_file_path = f'{feature_name}Feature/Tests/TargetTests.swift'
    test_content = '''import XCTest

class TargetTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertEqual("A", "A")
    }

}
'''
    write_code_in_file(test_file_path, test_content)

def write_created_feature_on_dependency_project(feature_name):
    file_path = f'{root_path}/Plugin/UtilityPlugin/ProjectDescriptionHelpers/Dependency+Project.swift'
    read_file = read_file_at(file_path)
    updated_file = update_file_at(read_file, feature_name)
    write_file_at(file_path, updated_file)

def read_file_at(file_path):
    with open(file_path, 'r') as file:
        return file.readlines()

def update_file_at(dependency_file, feature_name):
    dependency_file_len = len(dependency_file)
    for index, elem in enumerate(dependency_file):
        if "public extension TargetDependency.Project.Features" in elem:
            insert_line = index + 1
            break
        
    append_code = f'    static let {feature_name}Feature = TargetDependency.feature(name: "{feature_name}Feature")\n'

    if dependency_file_len > int(insert_line):
        dependency_file.insert(insert_line, append_code)
    
    return dependency_file

def write_file_at(file_path, update_file):
    with open(file_path, 'w') as file:
        file.writelines(update_file)

print('Input new feature name ', end=': ', flush=True)
feature_name = sys.stdin.readline().replace("\n", "")

print('Include demo? (Y or N, default = N) ', end=': ', flush=True)
has_demo = sys.stdin.readline().replace("\n", "").upper() == "Y"

print(f'Start to generate the new feature named {feature_name}...')

current_file_path = os.path.dirname(os.path.abspath(__file__))
os.chdir(current_file_path)
os.chdir(os.pardir)
root_path = os.getcwd()
os.chdir(root_path + '/Projects/Features')

make_new_feature(feature_name, has_demo)
write_created_feature_on_dependency_project(feature_name)
