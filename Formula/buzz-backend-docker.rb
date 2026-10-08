class BuzzBackendDocker < Formula
  desc "Run Buzz agents on your own server: remote-agent backend for any Docker host"
  homepage "https://github.com/abipalli/buzz-backend-docker"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.3/buzz-backend-docker-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "16444929b797efd3bc2962fe7c3d640e720b95e3f48e6d977275660f0e23e078"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.3/buzz-backend-docker-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "71bbed7a6efbf73ef24a66e259ffb133b0d8f4393ef4022aa85f547564ad707f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.3/buzz-backend-docker-v0.2.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f1b85c49ae4f26598b39a14805f8cffaf34aed6a73004ae9d01b777bdd5abf3f"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.2.3/buzz-backend-docker-v0.2.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "77bd4a04661a5551a52eb3aafcc808c06b6a816b9f338a5b227962cc4528173a"
    end
  end

  def install
    bin.install "buzz-backend-docker"
  end

  def caveats
    <<~EOS
      Finish with one command (links the provider where Buzz Desktop looks and
      checks your server):

        buzz-backend-docker setup ssh://you@your-server
    EOS
  end

  test do
    assert_match '"protocol_version":1', pipe_output(bin/"buzz-backend-docker", '{"op":"info"}')
  end
end
