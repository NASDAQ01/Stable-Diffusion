🔹 Order Breakdown
Git Setup
*   Configure identity (user.name, user.email) → ensures commits are properly attributed.
*   Clone repo → gets your local copy.
* Fix remote URL → aligns with the renamed GitHub repo (Stable-Diffusion).


ControlNet Models
* Create controlnet-models folder → prepares structure.
* Add script with vi → defines download commands.
* Make script executable → ensures it can run.
* Commit & push → versions the script in GitHub.
* Usage instructions → shows how to run the script to pull models.


ControlNet Model Reference
* Explains what each model does (canny, depth, openpose, lineart, scribble) → contextual knowledge for users.


Ollama Installation
* Install Ollama via curl → sets up runtime.
* Verify installation → confirms CLI works.




Ollama Models
* Pull models (llama2, codellama, mistral, gemma, phi) → downloads weights.
* Verify with ollama list → ensures they’re installed.
* Run a model → confirms functionality.


Ollama Model Reference
* Explains each model’s purpose → helps users choose the right one.


Workflow Diagram
* Shows how Ollama (text) + Stable Diffusion (image) + ControlNet (conditioning) interact.


Installation Flow Diagram
* Visualizes the exact sequence of steps you took.


Troubleshooting Guide
* Provides recovery paths for common errors (Git, Hugging Face, Ollama).


Summary
* Recaps everything installed and verified.








markdown
# Stable Diffusion + ControlNet + Ollama Setup


This document captures all the successful steps taken to install and configure:
- Git identity and repository setup
- ControlNet v1.1 model download script
- Stable Diffusion repo organization
- Ollama installation and model pulls
- Reference guide for ControlNet and Ollama models
- Visual diagrams for architecture and installation flow
- Troubleshooting guide


---


## 1. Git Setup


### Configure Git Identity
Run once per machine:
```bash
git config --global user.name "Emery"
git config --global user.email "emery.rudolph@gmail.com"
Clone Your Repo
bash
git clone git@github.com:NASDAQ01/Stable-Diffusion.git
cd Stable-Diffusion
git branch -M main
Fix Remote URL
Ensure the remote points to the correct repo name:


bash
git remote set-url origin git@github.com:NASDAQ01/Stable-Diffusion.git
git remote -v
2. ControlNet Models
Create Folder
bash
mkdir -p controlnet-models
Add Download Script
Open with vi:


bash
vi controlnet-models/download_controlnet_models.sh
Paste:


bash
#!/bin/bash
mkdir -p ~/open-webui/stable-diffusion-webui/models/ControlNet


wget https://huggingface.co/lllyasviel/control_v11p_sd15_canny/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet


wget https://huggingface.co/lllyasviel/control_v11f1p_sd15_depth/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet


wget https://huggingface.co/lllyasviel/control_v11p_sd15_openpose/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet


wget https://huggingface.co/lllyasviel/control_v11p_sd15_lineart/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet


wget https://huggingface.co/lllyasviel/control_v11p_sd15_scribble/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet
Save (Esc, :wq) and make executable:


bash
chmod +x controlnet-models/download_controlnet_models.sh
Commit & Push
bash
git add controlnet-models/download_controlnet_models.sh
git commit -m "Add ControlNet v1.1 model download script"
git push -u origin main
Usage
Run the script:


bash
./controlnet-models/download_controlnet_models.sh
Models will be saved under:


Code
~/open-webui/stable-diffusion-webui/models/ControlNet/
3. ControlNet Model Reference
Canny → Uses edge detection to guide generation. Great for preserving outlines and structure.


Depth → Uses depth maps to enforce 3D structure and perspective in generated images.


OpenPose → Guides generation using human pose skeletons. Ideal for character positioning.


Lineart → Uses clean line drawings to control composition. Useful for anime/manga workflows.


Scribble → Turns rough sketches into coherent images. Great for concept art and quick drafts.


4. Ollama Installation
Install Ollama
bash
curl -fsSL https://ollama.com/install.sh | sh
Verify Installation
bash
ollama --version
ollama list
5. Ollama Models
Pull Models
bash
ollama pull llama2
ollama pull codellama
ollama pull mistral
ollama pull gemma
ollama pull phi
Verify
bash
ollama list
Expected output shows all downloaded models.


Run a Model
bash
ollama run llama2
6. Ollama Model Reference
Llama 2 → General-purpose large language model. Balanced for reasoning, text generation, and chat.


CodeLlama → Specialized for programming tasks. Great for code completion, debugging, and explanations.


Mistral → Lightweight, efficient model with strong performance for text generation and summarization.


Gemma → Google’s open model optimized for dialogue and reasoning.


Phi → Microsoft’s compact model, efficient for smaller hardware while still strong in reasoning.


7. Workflow Diagram
Code
            ┌───────────────┐
            │   Ollama LLMs │
            │ (llama2, etc.)│
            └───────┬───────┘
                    │
         Text prompt│
                    ▼
        ┌───────────────────────┐
        │   Stable Diffusion    │
        │  (Image Generation)   │
        └─────────┬─────────────┘
                  │
   Conditioning   │
   inputs         ▼
 ┌───────────────────────────────┐
 │         ControlNet Models      │
 │ (canny, depth, openpose, etc.) │
 └───────────────────────────────┘
                  │
                  ▼
        ┌───────────────────────┐
        │   Final Generated     │
        │        Image          │
        └───────────────────────┘
8. Installation Flow Diagram
Code
 ┌───────────────────────────┐
 │   Configure Git Identity  │
 │  (user.name, user.email)  │
 └───────────────┬───────────┘
                 │
                 ▼
 ┌───────────────────────────┐
 │   Clone Repo (GitHub)     │
 │   NASDAQ01/Stable-Diffusion │
 └───────────────┬───────────┘
                 │
                 ▼
 ┌───────────────────────────┐
 │   Fix Remote URL          │
 │   (Stable-Diffusion.git)  │
 └───────────────┬───────────┘
                 │
                 ▼
 ┌───────────────────────────┐
 │   Create controlnet-models│
 │   folder + script         │
 └───────────────┬───────────┘
                 │
                 ▼
 ┌───────────────────────────┐
 │   Commit & Push Script    │
 │   to GitHub               │
 └───────────────┬───────────┘
                 │
                 ▼
 ┌───────────────────────────┐
 │   Install Ollama          │
 │   (curl install.sh)       │
 └───────────────┬───────────┘
                 │
                 ▼
 ┌───────────────────────────┐
 │   Pull Ollama Models      │
 │   (llama2, codellama,     │
 │    mistral, gemma, phi)   │
 └───────────────┬───────────┘
                 │
                 ▼
 ┌───────────────────────────┐
 │   Verify & Run Models     │
 │   (ollama list, run)      │
 └───────────────────────────┘
9. Troubleshooting Guide
Git Issues
Error: not a valid repository name → Ensure your remote is set to git@github.com:NASDAQ01/Stable-Diffusion.git.


bash
git remote set-url origin git@github.com:NASDAQ01/Stable-Diffusion.git
Error: pathspec did not match any files → The file doesn’t exist at the path you tried to add. Double-check with ls controlnet-models/.


Hugging Face Model Downloads
Error: 404 Not Found → The model link may have changed. Visit lllyasviel’s Hugging Face page to confirm the latest URLs.


Slow downloads → Use wget -c to resume interrupted downloads.


Ollama Issues
Error: ollama: command not found → Ensure Ollama is installed and added to PATH. Restart your shell after install.


Error pulling models → Check internet connection and retry:


bash
ollama pull llama2
Verify installation


bash
ollama list
✅ Summary
Git identity configured (user.name, user.email)


Repo cloned and branch set to main


Remote fixed to Stable-Diffusion


controlnet-models/ folder created


Download script added, made executable, committed, pushed


ControlNet models documented