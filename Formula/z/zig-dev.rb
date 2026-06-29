class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260628-025533"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "74663381b295aab9861a4efd0ffff65826be9d0cd25fd3fc0835f1bfb7a80b54"
    sha256 cellar: :any_skip_relocation, sequoia:      "4c4b0c85ac5aa1e7da9b3001483c7ae4f9a64dbf410fc9b3f89f8518f5ee15d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3ae171fb02b08167c55026a0812dd58484e06b9bae04809c1e29fedfe1c3f32a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "93699ac2c3c9eb7acdeed2914b4361cda5ad29d40a21c5550fd8a2b85963955b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8298223a6150fb42c292ab2ab793405aafa747548a133ab8c15cbbcd3d4012e3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8f30d8405a6123f0c7111c8a4c5aee7e730173135c5ddcc9424527a43c5bbd7b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1099+7db2ef610.tar.xz"
  version "0.17.0-dev.1099+7db2ef610"
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
