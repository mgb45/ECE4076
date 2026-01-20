# ECE4076/5176 Computer Vision

Interactive class notebooks for ECE4076/5176 Computer Vision at Monash University.

This repository contains in-class activities using Jupyter notebooks alongside pre-recorded lectures, paired with laboratory sessions where students implement related concepts. The course covers both classical computer vision and modern deep learning methods.

---

## Course Content

### Main Weeks

- **Week 1:** Image handling and basic manipulation, high dimensional signals
- **Week 2:** Image filtering, Difference of Gaussians, Keypoint Detection, Patch Matching
- **Week 3:** Invariances and image transformations, asymmetric feature matching
- **Week 4:** Camera models and homography estimation using RANSAC
- **Week 5:** Camera projection, vanishing points and lines
- **Week 6:** Multiple view geometry, space carving
- **Week 7:** Clustering and Gaussian mixture models
- **Week 8:** Logistic regression and face detection
- **Week 9:** Understanding gradient descent
- **Week 10:** Object detection with AlexNet and ResNets
- **Week 11:** Object recognition with RCNNs and YOLO
- **Week 12:** Image segmentation with U-Nets

### Bonus Content

Additional material available in the `bonus_content/` folder:
- Vision Transformers
- Variational Autoencoders
- Generative Adversarial Networks
- CLIP (Contrastive Language-Image Pre-training)
- Diffusion Models

---

## Installation (5 minutes)

**Warning:** This installation will take a significant amount of disk space. If your hard drive is full, you may want to consider opening the notebooks in Google Colab instead and installing required packages as needed.

### Prerequisites

- **Python 3.8+** - Download from [python.org](https://www.python.org/)
  - Windows users: Check "Add Python to PATH" during installation
- **VS Code** (recommended) - Download from [code.visualstudio.com](https://code.visualstudio.com/)

### Setup Steps

**Step 1: Run the installer**

Open Terminal/Command Prompt in this folder and run:

```bash
# Linux/macOS
chmod +x install.sh
./install.sh

# Windows
install.bat
```

**Step 2: Open in VS Code**

- File → Open Folder → Select this ECE4076 folder
- Wait for VS Code to load (~10 seconds)
- Click "Install" when prompted to install recommended extensions

**Step 3: Start a notebook**

- Click any `.ipynb` file in the Explorer panel
- Select the **ECE4076** kernel when prompted
- You're ready to go!

### Alternative: Command Line Only

If you prefer Jupyter in your browser:

```bash
# Activate environment
source ece4076_env/bin/activate      # Linux/macOS
ece4076_env\Scripts\activate.bat      # Windows

# Start Jupyter
jupyter notebook
```

---

## VS Code Features

### Running Cells

| Action | Shortcut |
|--------|----------|
| Run cell | Click ▶ or Ctrl+Alt+Enter |
| Run all cells | View → Run All Cells |
| Run cells above | Cell menu → Run Above |

### Useful Shortcuts

| Action | Shortcut |
|--------|----------|
| Command Palette | Ctrl+Shift+P (Cmd+Shift+P on Mac) |
| Find File | Ctrl+P (Cmd+P) |
| Find in Files | Ctrl+Shift+F (Cmd+Shift+F) |
| Toggle Terminal | Ctrl+` |
| Split Editor | Ctrl+\ |

### Python IntelliSense

- Type code → Auto-suggestions appear
- Ctrl+Space → Manual suggestions
- Hover over functions → See documentation

### Debugging

1. Click left margin next to line numbers to set breakpoints
2. Run → Start Debugging (F5)
3. Use debug panel to step through code

---

### Advanced Packages (Optional)

Some bonus notebooks require additional packages:
- **CLIP (Bonus):** Uncomment CLIP in `requirements.txt` and reinstall

---

## Troubleshooting

### "Python is not installed"
**Solution:** Download and install from [python.org](https://www.python.org/)
- **Windows:** Check "Add Python to PATH" during installation
- **macOS:** Use Homebrew: `brew install python3`
- **Linux:** Use package manager: `apt install python3` or `yum install python3`

Verify: `python3 --version`

### "Permission denied" (Linux/macOS)
**Error:** `bash: ./install.sh: Permission denied`

**Solution:**
```bash
chmod +x install.sh
./install.sh
```

### Installation hangs or takes too long
**Solution:** Be patient! PyTorch downloads can take time.
- Check internet connection
- If interrupted, run the script again—it resumes from where it left off
- Ensure you have ~2GB free disk space

### "ModuleNotFoundError" when running notebooks
**Solution:** Make sure you're using the ECE4076 kernel
1. In VS Code: Look for "Select Kernel" button (top right of notebook)
2. Choose "ECE4076 (./ece4076_env/bin/python)"

If not available:
```bash
source ece4076_env/bin/activate  # Linux/macOS
python -m ipykernel install --user --name ece4076 --display-name "ECE4076"
```

### "Kernel not found" in VS Code
**Solution:**
1. Terminal → New Terminal (Ctrl+`)
2. Run:
   ```bash
   source ece4076_env/bin/activate  # Linux/macOS
   python -m ipykernel install --user --name ece4076 --display-name "ECE4076"
   ```
3. Reload VS Code (Ctrl+Shift+P → Reload Window)

### "ImportError: No module named 'cv2'" or similar
**Solution:** Activate the environment before running notebooks
```bash
source ece4076_env/bin/activate      # Linux/macOS
ece4076_env\Scripts\activate.bat      # Windows
jupyter notebook
```

### Need to reinstall everything
```bash
# Linux/macOS
rm -rf ece4076_env
./install.sh

# Windows
# Delete the ece4076_env folder manually
# Then double-click install.bat
```

### Still stuck?
1. Check the error message—it often contains the solution
2. Search the error online (Stack Overflow, GitHub)
3. Contact your instructor

---

## Preparation

You may want to brush up on Python skills before starting. Check out this [Python intro notebook](https://github.com/jhy9968/CV_python_intro_ws).

---

## Contributors & Acknowledgements

- Michael Burke
- Mehrtash Harandi
- Aaron Choong
- Haoyang Jiang
- Week 5 based on an example from Tom Drummond

