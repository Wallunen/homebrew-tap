class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260605-174905"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0ddb383e4133e2c218775adfeb3213485e434ce31657933903f44f1b8593bdce"
    sha256 cellar: :any_skip_relocation, sequoia:      "0bfa6b0e45e42058ca93d4a14721ca549ec0e8bef9bb1b5440db880d9057cf01"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ae4c45c899277511f25ab59ba40d7f4f7563fe805a07ddd7201866a4b9406d28"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "610205c6ab2e85e3285bbf2df31a746c321a5def66cd6427543be46e250775e7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f851dac9bca925e2934f8f85ff5f17b1913a26eaa6d1bee49993176bcf0393f9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "45102dfb5ad9b65bb2dadf8b05f289f687c568450fad2fe22fc9be456f8f11a9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.702+18b3c78a9.tar.xz"
  version "0.17.0-dev.702+18b3c78a9"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
