class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260420-165916"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8fd7b4d77f6bce618f4c04f8007e096517184d6f1223783cc2a4a86c9d51c9c2"
    sha256 cellar: :any_skip_relocation, sequoia:      "adecdcc3f7e7abc46a3aab5a19f3529749af9e44b680b260fd653ed6526f7155"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f77b58f19bd8cc6bcd03bd07fe2421b713dbcd3d7b2f895ce3518e8b06999fac"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "54c568e957e9072a7bd02be131d03962123ae6c959959a417c82abcd8613c313" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4774adbfc42dbef22362562a943abc3f685eb3248e31a6ca22c2156d09405ba0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e5b6519775911b5fdefb3c90f26dcd63ad5dc02c703071793c18f9b403e7aef6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.44+0177cb57c.tar.xz"
  version "0.17.0-dev.44+0177cb57c"
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
