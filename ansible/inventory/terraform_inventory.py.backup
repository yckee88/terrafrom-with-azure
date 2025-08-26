#!/usr/bin/env python3
import json
import subprocess
import sys
import os

def get_terraform_outputs():
    """Get Terraform outputs as JSON"""
    try:
        # Try multiple possible terraform directories
        terraform_dirs = [
            '../',  # One level up from ansible/
            '../../',  # Two levels up
            './',   # Current directory
        ]
        
        for terraform_dir in terraform_dirs:
            if os.path.exists(os.path.join(terraform_dir, 'main.tf')) or os.path.exists(os.path.join(terraform_dir, 'terraform.tfstate')):
                print(f"Found Terraform directory: {terraform_dir}", file=sys.stderr)
                old_cwd = os.getcwd()
                os.chdir(terraform_dir)
                
                # Check if terraform state exists
                if not os.path.exists('terraform.tfstate') and not os.path.exists('.terraform/terraform.tfstate'):
                    print("No terraform state found. Run 'terraform apply' first.", file=sys.stderr)
                    os.chdir(old_cwd)
                    return {}
                
                result = subprocess.run(['terraform', 'output', '-json'], 
                                      capture_output=True, text=True, check=True)
                os.chdir(old_cwd)
                return json.loads(result.stdout)
        
        print("No Terraform directory found!", file=sys.stderr)
        return {}
        
    except subprocess.CalledProcessError as e:
        print(f"Error running terraform output: {e}", file=sys.stderr)
        print(f"stderr: {e.stderr}", file=sys.stderr)
        return {}
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        return {}

def main():
    if len(sys.argv) == 2 and sys.argv[1] == '--list':
        outputs = get_terraform_outputs()
        
        inventory = {
            '_meta': {
                'hostvars': {}
            },
            'aks_clusters': {
                'hosts': [],
                'vars': {}
            },
            'all': {
                'vars': {
                    'ansible_connection': 'local'
                }
            }
        }
        
        # Debug: Print available outputs
        print(f"Available Terraform outputs: {list(outputs.keys())}", file=sys.stderr)
        
        # Add AKS cluster info - adjust these key names to match your outputs
        if 'aks_cluster_name' in outputs:
            cluster_name = outputs['aks_cluster_name']['value']
            resource_group = outputs['resource_group_name']['value']
            
            inventory['aks_clusters']['hosts'] = [cluster_name]
            inventory['aks_clusters']['vars'] = {
                'aks_cluster_name': cluster_name,
                'aks_resource_group': resource_group,
                'acr_login_server': outputs.get('acr_login_server', {}).get('value', ''),
                'postgres_fqdn': outputs.get('postgres_fqdn', {}).get('value', ''),
                'key_vault_name': outputs.get('key_vault_name', {}).get('value', '')
            }
            
            inventory['_meta']['hostvars'][cluster_name] = {
                'aks_cluster_name': cluster_name,
                'aks_resource_group': resource_group
            }
        
        print(json.dumps(inventory, indent=2))
    
    elif len(sys.argv) == 3 and sys.argv[1] == '--host':
        # Return empty for specific host queries
        print('{}')
    
    else:
        print("Usage: {} --list or {} --host <hostname>".format(sys.argv[0], sys.argv[0]), file=sys.stderr)
        sys.exit(1)

if __name__ == '__main__':
    main()