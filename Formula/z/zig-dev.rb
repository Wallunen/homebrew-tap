class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "adbe84757c29b3536c5e9124467c29bebf5d6ed2bcd9e2baa750f6b8a90c825f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "089907f685ba8c82fc054c17b5b66feb2ac165e9b0649b9bc6f1a8ac4ef8f39d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5acc877e599e4022dc7eb92c031c134d4b740af92c941cf67623b7b19b1fcf25" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2545+e2e363361.tar.xz"
  version "0.14.0-dev.2545+e2e363361"
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
