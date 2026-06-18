class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260615-194141"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "40731bff82377fe9dc25da5b629af79050434e5708a4fa18d0e5672bc8ce580c"
    sha256 cellar: :any_skip_relocation, sequoia:      "269421768ad573cb703243c0be357eda9e45c7bbccc13cab67f9d35c2ab49a16"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a36d6f822917f8ece7f1f54fc550f035f1e2721e771723ac02ef7b55b2feea8"
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
