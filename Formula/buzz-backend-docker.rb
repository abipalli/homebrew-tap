class BuzzBackendDocker < Formula
  desc "Run Buzz agents on your own server: remote-agent backend for any Docker host"
  homepage "https://github.com/abipalli/buzz-backend-docker"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.1.0/buzz-backend-docker-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "e696b662e8414605f465c5191a7288a18eab5d1af1aed07cb72ca328828ccdd1"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.1.0/buzz-backend-docker-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3f6c6e40f8ad9f36d0ba80253a50ae6b13ce6ddbda50ee7cc9f55f8b3fe5e142"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.1.0/buzz-backend-docker-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cbd0b50590968f266af7c033506b9b5b24c2391d4e122594256145c513d41536"
    end
    on_intel do
      url "https://github.com/abipalli/buzz-backend-docker/releases/download/v0.1.0/buzz-backend-docker-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "87e80df583f8631c52a385514cf27206e5a75901f5b0794027ff260e4f64be3b"
    end
  end

  def install
    bin.install "buzz-backend-docker"
  end

  def caveats
    <<~EOS
      Buzz Desktop opened from Finder or the Dock does not search Homebrew's
      bin directory. Link the provider where Desktop always looks:

        mkdir -p ~/.local/bin
        ln -sf #{HOMEBREW_PREFIX}/bin/buzz-backend-docker ~/.local/bin/buzz-backend-docker
    EOS
  end

  test do
    assert_match '"protocol_version":1', pipe_output(bin/"buzz-backend-docker", '{"op":"info"}')
  end
end
