FROM ruby:3.2-slim

# System packages for Ruby + Jupyter + IRuby
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    python3 \
    python3-pip \
    libzmq3-dev \
    libffi-dev \
    libsqlite3-dev \
    libreadline-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter (system-wide — avoids Python venv confusion) -- need to break system packages for this
# but since were in docker shouldnt be a problem
RUN pip3 install --no-cache-dir --break-system-packages jupyter jupyterlab notebook jupyter-kernel-gateway

# Install IRuby and register kernel
RUN gem install iruby && iruby register --force

# Install Ruby OpenAI SDK and async gem
RUN gem install ruby-openai async

# Confirm kernel was registered
RUN jupyter kernelspec list

# Set working directory
WORKDIR /workspace

# Add Gemfile and install any other gems
COPY Gemfile Gemfile.lock* ./
RUN bundle install || true

# Create scripts directory
RUN mkdir -p /workspace/scripts

# Expose Jupyter port
EXPOSE 8888

# Copy scripts if they exist
COPY scripts/ /workspace/scripts/

# Start Jupyter Lab with no token
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''"]
