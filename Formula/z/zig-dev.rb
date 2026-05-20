class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260520-181216"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "632224fb3491beae04988df3d971883d93c5b6bc6e10ead6525f99c2708c90eb"
    sha256 cellar: :any_skip_relocation, sequoia:      "96db8f1deeedd8856983f3a3b7bee25f49d7e2ef5bcbd82369c7b86c7efd2796"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be13d29b3c5972d7887b15207986310c8835ffa2f54fb925c61184656b9876a5"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "54f64a5655b36b549c989e2a6dca351ca610293e51602ada5b8c46f902c20f31" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "22de000f2b82d8a71c93f816dabe4ba224473d4e802b28eab77bfa877998a389" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ee19df2467fc67af43fefcdaba5bc4f4c1ec114454a3b6cfaa661b6aab063cc1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.314+eae06cf5c.tar.xz"
  version "0.17.0-dev.314+eae06cf5c"
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
