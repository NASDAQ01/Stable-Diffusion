markdown
# Open WebUI

Open WebUI is an extensible, feature-rich, and user-friendly self-hosted AI platform designed to operate entirely offline. It supports various LLM runners like Ollama and OpenAI-compatible APIs, with a built-in inference engine for RAG, making it a powerful AI deployment solution.

Passionate about open-source AI? Join our team →

[Open WebUI Demo](#)

---

## Key Features of Open WebUI ⭐
- 🚀 Effortless Setup: Install seamlessly using Docker or Kubernetes with support for both `:ollama` and `:cuda` tagged images.
- 🤝 Ollama/OpenAI API Integration: Integrate OpenAI-compatible APIs alongside Ollama models.
- 🛡️ Granular Permissions and User Groups
- 🔄 SCIM 2.0 Support
- 📱 Responsive Design + Progressive Web App (PWA)
- ✒️🔢 Full Markdown and LaTeX Support
- 🎤📹 Hands-Free Voice/Video Call
- 🛠️ Model Builder
- 🐍 Native Python Function Calling Tool
- 📚 Local RAG Integration
- 🔍 Web Search for RAG
- 🌐 Web Browsing Capability
- 🎨 Image Generation Integration
- ⚙️ Many Models Conversations
- 🔐 Role-Based Access Control (RBAC)
- 🌐🌍 Multilingual Support
- 🧩 Pipelines, Plugin Support
- 🌟 Continuous Updates

For more information, check out the [Open WebUI Documentation](#).

---

## Installation 🚀

### Python pip 🐍
```bash
pip install open-webui
open-webui serve
Access at: http://localhost:8080

Quick Start with Docker 🐳
bash
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway \
-v open-webui:/app/backend/data --name open-webui --restart always \
ghcr.io/open-webui/open-webui:main
(See documentation for GPU, Ollama-bundled, and advanced options.)

License 📜
This project contains code under multiple licenses. See LICENSE and LICENSE_HISTORY for details.

Advanced Setup: Stable Diffusion + ControlNet + Ollama
This section documents a reproducible workflow for integrating Stable Diffusion, ControlNet v1.1 models, and Ollama.

1. Git Setup
bash
git config --global user.name "Emery"
git config --global user.email "emery.rudolph@gmail.com"

git clone git@github.com:NASDAQ01/Stable-Diffusion.git
cd Stable-Diffusion
git branch -M main
git remote set-url origin git@github.com:NASDAQ01/Stable-Diffusion.git
2. ControlNet Models
Create folder and script:

bash
mkdir -p controlnet-models
vi controlnet-models/download_controlnet_models.sh
Paste script (canny, depth, openpose, lineart, scribble). Make executable and commit:

bash
chmod +x controlnet-models/download_controlnet_models.sh
git add controlnet-models/download_controlnet_models.sh
git commit -m "Add ControlNet v1.1 model download script"
git push -u origin main
Run script:

bash
./controlnet-models/download_controlnet_models.sh
3. ControlNet Model Reference
Canny → Edge detection guidance

Depth → 3D structure enforcement

OpenPose → Human pose skeleton guidance

Lineart → Composition via line drawings

Scribble → Rough sketch to image

4. Ollama Installation
bash
curl -fsSL https://ollama.com/install.sh | sh
ollama --version
ollama list
5. Ollama Models
bash
ollama pull llama2
ollama pull codellama
ollama pull mistral
ollama pull gemma
ollama pull phi
ollama list
ollama run llama2
6. Ollama Model Reference
Llama 2 → General-purpose

CodeLlama → Programming tasks

Mistral → Lightweight, efficient

Gemma → Dialogue and reasoning

Phi → Compact, efficient reasoning

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
 └───────────────┬───────────┘
                 ▼
 ┌───────────────────────────┐
 │   Clone Repo              │
 └───────────────┬───────────┘
                 ▼
 ┌───────────────────────────┐
 │   Fix Remote URL          │
 └───────────────┬───────────┘
                 ▼
 ┌───────────────────────────┐
 │   Create controlnet-models│
 │   folder + script         │
 └───────────────┬───────────┘
                 ▼
 ┌───────────────────────────┐
 │   Commit & Push Script    │
 └───────────────┬───────────┘
                 ▼
 ┌───────────────────────────┐
 │   Install Ollama          │
 └───────────────┬───────────┘
                 ▼
 ┌───────────────────────────┐
 │   Pull Ollama Models      │
 └───────────────┬───────────┘
                 ▼
 ┌───────────────────────────┐
 │   Verify & Run Models     │
 └───────────────────────────┘
9. Troubleshooting Guide
Git
not a valid repository name → Fix remote URL

pathspec did not match any files → Check file path

Hugging Face
404 Not Found → Verify model URL

Slow downloads → Use wget -c

Ollama
ollama: command not found → Reinstall, check PATH

Pull errors → Retry with ollama pull llama2

Verify → ollama list

✅ Summary
Repo cloned, branch set to main

ControlNet script created, committed, pushed

Models downloaded (canny, depth, openpose, lineart, scribble)

Ollama installed, models pulled (llama2, codellama, mistral, gemma, phi)

Diagrams included for architecture and installation flow

Troubleshooting guide added
