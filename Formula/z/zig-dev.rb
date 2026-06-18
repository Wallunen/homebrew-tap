class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260618-032538"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f4c123a137ffdc3f594f0c0c0e8a40ba95a0088aba5f2cb39d857970fb7f0246"
    sha256 cellar: :any_skip_relocation, sequoia:      "cc96e2abca853741d7c02ff24d9f503c66909ebec0e51c3b266642c91d54ae11"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b171ad432eba64520f4b946b7d67ac62cff46cf33453dd13cea7636628f1ea67"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ec9b05ef7fba3068bac167bb8b3f1f931a32c4b5a66af00266b9f7e53e617aec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5c7e8006550393a7e65a72450077c1f05ff9c4963cf34cd83aa3c32e0db51553" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5c843c0b11faa95f0128cf89d25d8f2a8f7ba53ffe7ebbd7ed6cca65236aeadc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.877+a3ae499dc.tar.xz"
  version "0.17.0-dev.877+a3ae499dc"
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
